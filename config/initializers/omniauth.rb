Rails.application.config.middleware.use OmniAuth::Builder do
  provider :netatmo, ENV["NETATMO_ID"] , ENV["NETATMO_SECRET"]
end
