Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
       post  '/auth/user-signup', to: 'users#create'
       post  '/auth/organizer-signup', to: 'event_organizers#create'
       post  '/auth/user-login', to: 'authentication#user_login'
       post  '/auth/organizer-login', to: 'authentication#organizer_login'
       get   '/users/:id', to: 'users#show'
       get   '/event_organizers/:id', to: 'event_organizers#show'
end
