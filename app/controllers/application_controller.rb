class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Response

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({message: exception.message}, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({message: exception.message}, :invalid)
  end

  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
end
