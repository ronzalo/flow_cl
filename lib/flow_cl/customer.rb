# frozen_string_literal: true

module FlowCl
  module Customer
    # Permite crear un nuevo cliente. El servicio retorna el objeto cliente creado.
    def create_customer(params: {})
      path = '/api/customer/create'

      private_post(path, params)
    end

    # Este servicio permite editar los datos de un cliente
    def edit_customer(params: {})
      path = '/api/customer/edit'

      private_post(path, params)
    end

    # Permite eliminar un cliente.
    # Para eliminar un cliente, este no debe tener suscripciones activas o importes pendientes de pago.
    def delete_customer(customer_id:)
      path = '/api/customer/delete'

      private_post(path, { customerId: customer_id })
    end

    # Permite obtener la lista de clientes paginada de acuerdo a los parámetros de paginación.
    def customers(params: {})
      path = '/api/customer/list'

      private_get(path, params)
    end

    # Permite obtener los datos de un cliente en base a su customerId.
    def customer(customer_id:)
      path = '/api/customer/get'

      private_get(path, { customerId: customer_id })
    end

    # Envía a un cliente a registrar su tarjeta de crédito para poder efectuarle cargos automáticos.
    # El servicio responde con la URL para redirigir el browser del pagador y el token que identifica la transacción.
    # La url de redirección se debe formar concatenando los valores recibidos en la respuesta de la siguiente forma:
    # url + "?token=" +token
    def register_customer(customer_id:, url_return:)
      path = '/api/customer/register'

      private_post(path, { customerId: customer_id, url_return: url_return })
    end

    # Este servicio retorna el resultado del registro de la tarjeta de crédito de un cliente.
    def register_customer_status(token:)
      path = '/api/customer/getRegisterStatus'

      private_get(path, { token: token })
    end

    # Este servicio permite eliminar el registro de la tarjeta de crédito de un cliente.
    # Al eliminar el registro no se podrá hacer cargos automáticos y Flow enviará un cobro por email.
    def unregister_customer(customer_id:)
      path = '/api/customer/unRegister'

      private_post(path, { customerId: customer_id })
    end
  end
end
