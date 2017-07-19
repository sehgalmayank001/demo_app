class ContactUsController < ApplicationController
  def new
    @person = ContactUs.new
  end

  def send_mail
    person = contact_us_params
    @person=ContactUs.new(person)
    if @person.save
      UserMailer.contact_us(person.to_json).deliver_later
    else
      render 'new'
    end
  end
  private

  def contact_us_params
    params.require(:person).permit(:name, :email, :mobile_no, :description)
  end
end
