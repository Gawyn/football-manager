Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['omniauth']['facebook']['id'], ENV['omniauth']['facebook']['secret']
end
