class ContactUsController < ApplicationController
  def new
  end

  def send_mail
    person = contact_us_params
    UserMailer.contact_us(person).deliver!
  end
  private

  def contact_us_params
    params.require(:contact_us).permit(:name, :email, :mobile_no, :description)
  end
end
