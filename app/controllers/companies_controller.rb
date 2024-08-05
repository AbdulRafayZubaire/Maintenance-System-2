class CompaniesController < ApplicationController
ActsAsTenant.with_mutable_tenant do
      ActsAsTenant.current_tenant = new_tenant

      # Perform operations under the new tenant
      # Example: redirect to a different controller action
      redirect_to some_path
    end
end