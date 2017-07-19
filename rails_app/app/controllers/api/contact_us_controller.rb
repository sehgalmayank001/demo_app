class Api::ContactUsController < Api::ApiController
  # before_action :authenticate_with_token!

  def send_mail
    person = contact_us_params
    if !contact_us_params.has_key?(:name) then raise ActionController::ParameterMissing.new('name') end
    if contact_us_params['name'].class != String
      render json: { message: "Name should be a string", status: "Failure", code: "500" }, status: 500
      return
    end
    if !contact_us_params.has_key?(:email) then raise ActionController::ParameterMissing.new('email') end
    if !contact_us_params.has_key?(:mobile_no) then raise ActionController::ParameterMissing.new('mobile_no') end
    if !contact_us_params.has_key?(:description) then raise ActionController::ParameterMissing.new('description') end
    person=ContactUs.new(person)
    if person.save
      UserMailer.contact_us(person.to_json).deliver_later
      render json: {message: "Successful, check your mail", status: "Success" , code: "200"}, status: 200
    else
      render json: { message: person.errors, status: "Failure", code: "500" }, status: 500
    end
  end
  private

  def contact_us_params
    params.require(:contact_u).require(:person).permit(:name, :email, :mobile_no, :description)
  end
end
