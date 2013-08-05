Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, APP_CONFIG['omniauth']['facebook']['id'], APP_CONFIG['omniauth']['facebook']['secret']
end
