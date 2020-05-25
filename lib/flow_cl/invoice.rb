# frozen_string_literal: true

module FlowCl
  module Invoice
    # Este servicio permite obtener los datos de un Importe.
    def invoice(invoice_id:)
      path = '/api/invoice/get'

      private_get(path, { invoiceId: invoice_id })
    end

    # Este servicio permite obtener la lista de invoices vencidos, es decir, aquellos no pagados cuyo due_date este vencido.
    def invoice_over_due(params:)
      path = '/api/invoice/getOverDue'

      private_get(path, params)
    end

    # Este servicio permite cancelar un Importe (Invoice) pendiente de pago.
    def cancel_invoice(invoice_id:)
      path = '/api/invoice/cancel'

      private_post(path, { invoiceId: invoice_id })
    end

    # Este servicio permite reintentar el cobro de un Invoice vencido.
    def retry_invoice(invoice_id:)
      path = '/api/invoice/retryToCollect'

      private_post(path, { invoiceId: invoice_id })
    end
  end
end
