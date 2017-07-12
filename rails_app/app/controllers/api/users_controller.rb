class Api::UsersController < Api::ApiController
  include GeneratePassword
  skip_before_action :authenticate_with_token!, only: [:create]
  def create
    if !user_params.has_key?(:email) then raise ActionController::ParameterMissing.new('email') end
    user = User.new(user_params)
    user.password = paswd_gen
    puts user.password
    if user.save
      render json: {message: user, status: "Success", code: "200"}, status: 200
    else
      render json: { message: user.errors, status: "failure", code: "500" }, status: 500
    end
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end
end
