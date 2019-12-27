Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match 'subscribe', to: 'subscription#subscribe', via: [:post]
  match 'contacts', to: 'contacts#index', via: [:get]
end
