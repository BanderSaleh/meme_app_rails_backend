if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_meme-app', domain: 'http://localhost:3001/'
else
  Rails.application.config.session_store :cookie_store, key: '_meme-app' 
end
