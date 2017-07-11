class Api::UsersController < Api::ApiController
  include GeneratePassword
  skip_before_action :authenticate_with_token!, only: [:create]
  def create
    user = User.new(user_params)
    user.password = paswd_gen
    puts user.password
    if user.save
      render json: user, status: 200
    else
      render json: { errors: user.errors }, status: 500
    end
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end
end
