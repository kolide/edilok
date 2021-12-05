Rails.application.routes.draw do
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'signout' => 'sessions#destroy'

  scope ':account_id' do
    get 'dashboard' => 'pages#dashboard'
    resources :alerts
    resources :devices
    resources :reports
    resources :users
  end

  root "pages#dashboard"
end
