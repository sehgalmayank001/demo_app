class UserMailer < ApplicationMailer

  def contact_us(person)
    @name =person[:name]
    mail(:to => person[:email], :subject => 'Acknowledgement mail')
  end

  def registeration_mail(user)
    @email = user.email
    @data = user.password
    mail(:to => @email, :subject => 'Acknowledgement mail')
  end
end
