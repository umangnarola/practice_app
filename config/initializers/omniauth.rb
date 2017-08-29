OmniAuth.config.logger = Rails.logger

opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, "443945222647144", "615cd6e9b701f3731aa6cd2581f59672"
  # provider :github, Rails.application.secrets.github_client_id, Rails.application.secrets.github_client_secret, opts
end
