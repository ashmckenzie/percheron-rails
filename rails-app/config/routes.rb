Rails.application.routes.draw do
  resources :email_tests
  root 'email_tests#new'
end
