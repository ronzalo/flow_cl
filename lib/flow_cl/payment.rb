# frozen_string_literal: true

require 'time'

module FlowCl
  module Payment
    # Este método permite crear una orden de pago a Flow y recibe como respuesta la URL para redirigir el browser del pagador y el token que identifica la transacción.
    # La url de redirección se debe formar concatenando los valores recibidos en la respuesta de la siguiente forma:
    # url + "?token=" +token
    # Una vez que el pagador efectúe el pago, Flow notificará el resultado a la página del comercio que se envió en el parámetro urlConfirmation.
    def create_payment(params:)
      path = '/api/payment/create'

      private_post(path, params)
    end

    # Permite generar un cobro por email.
    # Flow emite un email al pagador que contiene la información de la Orden de pago y el link de pago correspondiente.
    # Una vez que el pagador efectúe el pago, Flow notificará el resultado a la página del comercio que se envió en el parámetro urlConfirmation.
    def create_payment_email(params:)
      path = '/api/payment/createEmail'

      private_post(path, params)
    end

    # Este método permite obtener la lista paginada de pagos recibidos en un día.
    # Los objetos pagos de la lista tienen la misma estructura de los retornados en los servicios payment/getStatus
    def payments(date:, params: {})
      path = '/api/payment/getPayments'

      date = Time.parse(date).strftime('%Y-%m-%d') if date.is_a?(String)

      private_get(path, { date: date }.merge(params))
    end

    # Este método se utiliza para obtener el estado de un pago.
    # Se debe utilizar en la página callback del comercio para recibir notificaciones de pagos.
    # Cada vez que el pagador efectúe un pago,
    # Flow enviará vía POST una llamada a la página del comercio,
    # pasando como parámetro un token que deberá utilizarse en este servicio.
    def payment_status(token:)
      path = '/api/payment/getStatus'

      private_get(path, { token: token })
    end

    # Este método permite obtener el estado de un pago en base al commerceId
    def payment_status_by_commerce_id(commerce_id:)
      path = '/api/payment/getStatusByCommerceId'

      private_get(path, { commerceId: commerce_id })
    end

    # Este método permite obtener el estado de un pago en base al flowOrder
    def payment_status_by_flow_order(flow_order:)
      path = '/api/payment/getStatusByFlowOrder'

      private_get(path, { flowOrder: flow_order })
    end
  end
end
