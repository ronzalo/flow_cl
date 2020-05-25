# frozen_string_literal: true

module FlowCl
  module Subscription
    # Este servicio permite crear una nueva suscripción de un cliente a un Plan.
    # Para crear una nueva suscripción, basta con enviar los parámetros planId y customerId, los parám
    # * subscription_start	Fecha de inicio de la suscripción
    # * couponId	Identificador de cupón de descuento
    # * trial_period_days	Número de días de Trial
    def create_subscription(params:)
      path = 'api/subscription/get'

      private_get(path, { params: params })
    end

    # Este servicio permite obtener los datos de una suscripción.
    def subscription(id:)
      path = 'api/subscription/get'

      private_get(path, { subscriptionId: id })
    end

    # Permite obtener la lista de suscripciones paginada de acuerdo a los parámetros de paginación.
    # Además, se puede definir los siguientes filtros:
    # filter: filtro por nombre del plan
    # status: filtro por estado de la suscripción.
    def subscriptions(params: {})
      path = 'api/subscription/get'

      private_get(path, params)
    end

    # Este servicio permite modificar los días de Trial de una suscripción.
    # Sólo se puede modificar los días de Trial a una suscripción que aún no se ha iniciado o que todavía está vigente el Trial.
    def change_trial(id:, trial_period_days:)
      path = 'api/subscription/changeTrial'

      private_post(path, { subscriptionId: id, trial_period_days: trial_period_days })
    end

    # Este servicio permite cancelar una suscripción. Existen formas de cancelar una suscripción:
    # * inmediatamente. Es decir, en este instante
    # * al terminar el perído vigente.
    # Si desea cancelar la suscripción inmediatamente, envíe el parámetro at_period_end con valor 0, si desea cancelarla al final del período vigente envíe el valor 1.
    def add_coupon_subscription(id:, coupon_id:)
      path = 'api/subscription/addCoupon'

      private_post(path, { subscriptionId: id, couponId: coupon_id })
    end

    # Este servicio permite eliminar el descuento que tenga la suscripción.
    # El eliminar el descuento de la suscripción, no elimina el descuento que podría tenar asociado el cliente.
    def delete_coupon_subscription(id:)
      path = 'api/subscription/addCoupon'

      private_post(path, { subscriptionId: id })
    end
  end
end
