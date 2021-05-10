class Checkout::PaymentsController < ApplicationController

    def create
        ad = Ad.find(params[:ad_id])
        ad.processing!

        order = Order.create(ad: ad, buyer_id: current_member.id)
        #order = find_by_sql("SELECT * FROM orders")
        #order = Order.create { ad: ad, buyer_id: current_member.id }
        order.waiting!        

        payment = PagSeguro::PaymentRequest.new

        payment.reference = order.id
        payment.notification_url = checkout_notifications_url  # fix later -- https://localhost:3000/checkout/notifications
        payment.redirect_url = root_url

        payment.items << {
            id: ad.id,
            description: ad.title,
            amount: ad.price.to_s.gsub(',','.')
        }

        response = payment.register

        if response.errors.any?
            redirect_to root_url, alert: "Erro ao processar compra. Favor entrar em contato com o SAC."
        else
            redirect_to response.url
        end
        #render text: "Processando..."
    end
end
