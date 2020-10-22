class ApplicationController < ActionController::Base
  before_action :cofigure_permitted_parameters, if: :devise_controller?

  protected

  def cofigure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :first_name, :last_name, :first_name_reading, :last_name_reading, :birthday]
    )
  end
end
