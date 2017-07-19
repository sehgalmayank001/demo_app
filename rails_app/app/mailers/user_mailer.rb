class UserMailer < ApplicationMailer
  require 'json'

  def contact_us(person)
    person = JSON.parse(person)
    @name =person['name']
    mail(:to => person['email'], :subject => 'Acknowledgement mail')
  end

  def registeration_mail(user,password)
    @email = user.email
    @data = password
    mail(:to => @email, :subject => 'Acknowledgement mail')
  end
end
