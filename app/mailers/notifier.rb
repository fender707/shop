class Notifier < ActionMailer::Base
  default from: "myfirstshop@example.com"
  

  def welcome(user)  
    @user = user
    mail(to: user.email,
       subject: "[Signed up] Welcome #{user}")
  end 

end
