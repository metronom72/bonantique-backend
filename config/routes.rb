Rails.application.routes.draw do
  scope :admin, admin: true do
    resources :contacts
    resources :categories
    resources :bonds
  end

  match 'subscribe', to: 'subscription#subscribe', via: [:post]
  match 'contacts', to: 'contacts#index', via: [:get]
  match 'categories', to: 'categories#index', via: [:get]
end
