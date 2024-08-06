class ApplicationController < ActionController::Base

  set_current_tenant_through_filter
  set_current_tenant_by_subdomain(:company, :id)
  before_action :set_tenant
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # binding.pry
  protected

  def set_tenant
    # binding.pry
    subdomain = request.subdomains.first
    return unless subdomain.present?

    company = Company.find_by(subdomain: subdomain)
    # return unless company.present?

    set_current_tenant(company)

    if current_user.present?
      return if current_user.company == company
      sign_out(current_user)
      redirect_to new_user_session_path
    end
  
    # set_current_tenant(current_user&.company)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role, :subdomain, :company_name, :logo])
  end
end
