class Notifier < ActionMailer::Base
  default from: "myfirstshop@example.com"
  

  def welcome(user)  
    @user = user
    mail(to: user,
       subject: "[Signed up] Welcome #{user}")
  end 

end
