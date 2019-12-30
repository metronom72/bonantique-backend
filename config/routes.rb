Rails.application.routes.draw do
  scope :admin, admin: true do
    resources :contacts
    resources :categories
  end

  match 'subscribe', to: 'subscription#subscribe', via: [:post]
  match 'contacts', to: 'contacts#index', via: [:get]
end
