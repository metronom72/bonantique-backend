Rails.application.routes.draw do
  scope :admin, admin: true do
    resources :contacts
  end

  match 'subscribe', to: 'subscription#subscribe', via: [:post]
  match 'contacts', to: 'contacts#index', via: [:get]
end
