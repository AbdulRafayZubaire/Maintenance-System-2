# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :require_no_authentication, only: [:new, :create]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super do |resource|
      # binding.pry
      if resource.persisted? # Check if the user was successfully created
        
        if resource.role == "owner"
          @company = create_company(params[:user][:company_name], params[:user][:subdomain], params[:user][:logo], resource.id)
          resource.update(company_id: @company.id)
        end
        UserMailer.with(user: resource).welcome_email
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  def create_company(company_name, subdomain, logo, owner_id)
    @company = Company.create(company_name: company_name, subdomain: subdomain, logo: logo, owner_id: owner_id)
  end
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
