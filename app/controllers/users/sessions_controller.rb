# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  #before_action :set_tenant, except: [:destroy]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    # subdomain = request.subdomains.first
    # Rails.logger.debug "Subdomain: #{subdomain}" 
    # binding.pry
   super
  end

  # POST /resource/sign_in
  def create
    # binding.pry
    super
  end

  # DELETE /resource/sign_out
  def destroy
    #binding.pry

    ActsAsTenant.without_tenant do
      super
    end
  end
  #private

  # def set_tenant
  #   @company = company.find_by!(id: request.subdomain)
  #   set_current_tenant(@company)
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
