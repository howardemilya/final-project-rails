OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '368016967993-k2vm7llaq9g2km5hb0kjlnm2m538ulb7.apps.googleusercontent.com', 'logT5oqRxqKkh0aQFcN1KBXm', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
