Masq::Engine.routes.draw do
  resource :account do
    get :activate
    get :password
    put :change_password

    resources :personas
    resources :sites
    resource :yubikey_association, :only => [:create, :destroy]
  end

  resource :password
  resource :session, :only => [:new, :create, :destroy]

  get "/help" => "info#help", :as => :help
  get "/safe-login" => "info#safe_login", :as => :safe_login

  get "/forgot_password" => "passwords#new", :as => :forgot_password
  get "/reset_password/:id" => "passwords#edit", :as => :reset_password

  get "/login" => "sessions#new", :as => :login
  get "/logout" => "sessions#destroy", :as => :logout
  post '/resend_activation_email/*account' => 'accounts#resend_activation_email', :as => :resend_activation_email

  get "/server" => "server#index", :as => :server
  post "/server" => "server#index"
  get "/server/decide" => "server#decide", :as => :decide
  get "/server/proceed" => "server#proceed", :as => :proceed
  post "/server/complete" => "server#complete", :as => :complete
  get "/server/cancel" => "server#cancel", :as => :cancel
  get "/server/seatbelt/config.:format" => "server#seatbelt_config", :as => :seatbelt_config
  get "/server/seatbelt/state.:format" => "server#seatbelt_login_state", :as => :seatbelt_state

  get "/consumer" => "consumer#index", :as => :consumer
  post "/consumer/start" => "consumer#start", :as => :consumer_start
  get "/consumer/complete" => "consumer#complete", :as => :consumer_complete

  get "/*account" => "accounts#show", :as => :identity

  root :to => "info#index"
end
