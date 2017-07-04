class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   if resource.class.to_s.eql? "User" && resource.sign_in_count == 1
  #     edit_user_password_path
  #   elsif resource.class.to_s.eql? "AdminUser"
  #     admin_dashboard_path
  #   else
  #     root_path
  #   end
  # end
end
