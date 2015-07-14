class Notifier < ActionMailer::Base
  default from: "Slava Sokalo <myfirstshop@example.com>"
  

  def welcome(order)  
    @order = order
    mail(to: order.email,
       subject: "[Signed up] Welcome #{order.name}")
  end 

end
