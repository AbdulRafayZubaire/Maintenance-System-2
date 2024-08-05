# config/initializers/acts_as_tenant.rb
ActsAsTenant.configure do |config|
  # Use  to identify the current tenant
  config.set_current_tenant_by_subdomain(:company, :id)
end
