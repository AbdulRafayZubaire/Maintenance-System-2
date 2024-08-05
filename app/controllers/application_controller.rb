class ApplicationController < ActionController::Base

  set_current_tenant_by_subdomain(:company, :id)

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_current_tenant
  before_action :authenticate_user!

  protected

  def set_current_tenant
    if user_signed_in?
      subdomain = current_user.subdomain
      if subdomain.present?
        # binding.pry
        # request.subdomains = [subdomain]
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role, :subdomain, :company_name, :logo])
  end
end
