# frozen_string_literal: true

require 'faraday'
require 'openssl'
require 'json'
require_relative 'error_handler'

API_URL = 'https://www.flow.cl'
API_SANDBOX_URL = 'https://sandbox.flow.cl'

module FlowCl
  class Client
    include FlowCl::Customer
    include FlowCl::Invoice
    include FlowCl::Merchant
    include FlowCl::Payment
    include FlowCl::Plan
    include FlowCl::Refund

    def initialize(key, secret, options = {})
      @key = key
      @secret = secret
      @sandbox = options.delete(:sandbox)
      @logger = options.delete(:logger)
    end

    private

    # Main faraday connection
    def conn
      url = @sandbox ? API_SANDBOX_URL : API_URL
      @conn ||= Faraday.new(url: url) do |faraday|
        faraday.use ErrorHandler
        faraday.response :logger if @logger
        faraday.adapter  Faraday.default_adapter # make requests with Net::HTTP
      end
    end

    def parsed_response(response)
      JSON.parse(response.body)
    end

    # Perform an authenticated GET request
    def private_get(path, params = {})
      response = conn.get path, final_params(params)

      parsed_response(response)
    end

    # Perform an authenticated POST request
    def private_post(path, params = {})
      response = conn.post path, URI.encode_www_form(final_params(params))

      parsed_response(response)
    end

    def final_params(params)
      params.merge!({
                      apiKey: @key
                    })
      params[:s] = signature(params)
      params
    end

    # Generate a signature based on OpenSSL
    def signature(params)
      formatted_params = params.sort.flatten.map(&:to_s).join
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), @secret, formatted_params)
    end
  end
end
