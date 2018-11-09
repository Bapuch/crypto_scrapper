Rails.application.routes.draw do
	root 'home#index'
  post '/', to: 'home#price'
end
