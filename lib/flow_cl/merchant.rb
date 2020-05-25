# frozen_string_literal: true

module FlowCl
  module Merchant
    # Permite obtener la lista de comercios paginada de acuerdo a los parámetros de paginación.
    # Además, se puede definir los siguientes filtros:
    # filter: filtro por nombre del comercio asociado
    # status: filtro por estado del comercio asociado
    def merchants(params: {})
      path = '/api/merchant/list'

      private_get(path, params)
    end

    # Este método permite obtener la información de un comercio asociado previamente creado en Flow
    def merchant(id:)
      path = '/api/merchant/get'

      private_get(path, { id: id })
    end

    # Este método permite crear un nuevo comercio asociado en Flow
    def create_merchant(params: {})
      path = '/api/merchant/create'

      private_post(path, params)
    end

    # Este método permite eliminar un comercio asociado previamente creado en Flow
    def delete_merchant(id:)
      path = '/api/merchant/delete'

      private_post(path, { id: id })
    end

    # Este método permite modificar un comercio asociado previamente creado en Flow
    def edit_merchant(params: {})
      path = '/api/merchant/edit'

      private_post(path, params)
    end
  end
end
