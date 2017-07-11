module Api
  class ApiController < ApplicationController
    include Concerns::Authenticable
    include Concerns::ExceptionHandler
    include Concerns::Response
    protect_from_forgery with: :null_session
    respond_to :json
    skip_before_action :authenticate_user!
    before_action :authenticate_with_token!
  end
end
