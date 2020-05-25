# frozen_string_literal: true

module FlowCl
  module Settlement
    # Este método se utiliza para obtener la liquidación de la fecha enviada como parámetro.
    def settlement_by_date(date:)
      path = 'api/settlement/getByDate'

      private_get(path, { date: date })
    end

    # Este método se utiliza para obtener el objeto Settlement correspondiente al identificador
    def settlement_by_id(id:)
      path = 'api/settlement/getById'

      private_get(path, { id: id })
    end
  end
end
