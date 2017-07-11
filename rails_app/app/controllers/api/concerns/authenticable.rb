module Api::Concerns
  module Authenticable

    # Devise methods overwrites
    def current_user
      @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
    end

    def authenticate_with_token!
      raise MyException::NotAuthorizedException unless current_user.present?
    end
  end
end
