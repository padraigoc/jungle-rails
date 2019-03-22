class UserMailer < ApplicationMailer
    default from: "definately-real@jungle.com"
    layout 'mailer'

    def order_confirmation_email (user, order)
        @order = order
        mail(:to => @order.email, :subject => "Order #{@order.id} received" )
      end


end
