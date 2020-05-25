# frozen_string_literal: true

module FlowCl
  module Plan
    # Este servicio permite crear un nuevo Plan de Suscripción
    def create_plan(params:)
      path = 'api/plans/create'

      private_post(path, params)
    end

    # Este servicio permite editar los datos de un Plan de Suscripción.
    # Si el plan tiene clientes suscritos,
    # sólo se puede modificar el campo trial_period_days.
    def edit_plan(params:)
      path = 'api/plans/edit'

      private_post(path, params)
    end

    # Este servicio permite eliminar un Plan de Suscripción.
    # El eliminar un Plan significa que ya no podrá suscribir nuevos clientes al plan.
    # Pero las suscripciones activas continuarán su ciclo de vida mientras estas no sean cancelas.
    def delete_plan(plan_id:)
      path = 'api/plans/delete'

      private_post(path, { planId: plan_id })
    end

    # Este servicio permite obtener los datos de un Plan de Suscripción
    def plan(plan_id:)
      path = 'api/plans/get'

      private_get(path, { planId: plan_id })
    end

    # Permite obtener la lista de planes de suscripción paginada de acuerdo a los parámetros de paginación.
    # Además, se puede definir los siguientes filtros:
    #
    # filter: filtro por nombre del plan
    # status: filtro por estado del plan
    def plans(params:)
      path = 'api/plans/list'

      private_get(path, params)
    end
  end
end
