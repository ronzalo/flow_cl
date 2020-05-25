# frozen_string_literal: true

module FlowCl
  module Refund
    # Este servicio permite crear una orden de reembolso.
    # Una vez que el receptor del reembolso acepte o rechaze el reembolso,
    # Flow notificará vía POST a la página del comercio identificada en urlCallback
    # pasando como parámetro token
    def create_refund(params:)
      path = 'api/refund/create'

      private_post(path, params)
    end

    # Permite obtener el estado de un reembolso solicitado.
    # Este servicio se debe invocar desde la página del comercio
    # que se señaló en el parámetro urlCallback del servicio refund/create.
    def refund_status(token:)
      path = 'api/refund/getStatus'

      private_get(path, { token: token })
    end
  end
end
