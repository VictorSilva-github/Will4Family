class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :birthday, :gender, :document_type, :document_number, :phone_number, :post_code, :address, :city, :country])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :birthday, :gender, :document_type, :document_number, :phone_number, :post_code, :address, :city, :country])
  end
end
