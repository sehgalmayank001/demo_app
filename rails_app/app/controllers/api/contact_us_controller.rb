class Api::ContactUsController < Api::ApiController
  # before_action :authenticate_with_token!

  def send_mail
    person = contact_us_params
    person=ContactUs.new(person)
    if person.save
      UserMailer.contact_us(person).deliver!
      render json: {response: "check your mail."}, status: 200
    else
      render json: { message: person.errors }, status: 500
    end
  end
  private

  def contact_us_params
    params.require(:person).permit(:name, :email, :mobile_no, :description)
  end
end
