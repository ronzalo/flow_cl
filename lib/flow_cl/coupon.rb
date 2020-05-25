# frozen_string_literal: true

module FlowCl
  module Customer
    # Este servicio permite crear un cupón de descuento
    def create_coupon(params:)
      path = 'api/coupon/create'

      private_post(path, params)
    end

    # Este servicio permite editar un cupón de descuento. Sólo se puede editar el nombre de un cupón.
    def edit_coupon(id:, name:)
      path = 'api/coupon/create'

      private_post(path, { couponId: id, name: name })
    end

    # Este servicio permite eliminar un cupón de descuento.
    # Eliminar un cupón de descuento no elimina los descuentos aplicados a clientes o suscripciones,
    # sólo no permite volver a aplicar este cupón
    def delete_coupon(id:)
      path = 'api/coupon/delete'

      private_post(path, { couponId: id })
    end

    # Este servicio permite obtener los datos de un cupón de descuento
    def coupon(id:)
      path = 'api/coupon/get'

      private_get(path, { couponId: id })
    end

    # Este servicio permite la lista de cupones de descuento
    def coupons(params:)
      path = 'api/coupon/list'

      private_get(path, params)
    end
  end
end
