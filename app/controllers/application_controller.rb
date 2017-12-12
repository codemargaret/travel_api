class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Response

  rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({message: exception.message}, :not_found)
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({message: exception.message}, :invalid)
  end
end
