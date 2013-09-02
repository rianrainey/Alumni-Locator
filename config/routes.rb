AlumniLocator::Application.routes.draw do
  devise_for :users

  get 'map', to: 'users#index', as: 'users'
  root to: redirect('/map')

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  # custom error routes
  match '/404' => 'errors#not_found'
  match '/422' => 'errors#unprocessable_entity'
  match '/500' => 'errors#application_error'
end
