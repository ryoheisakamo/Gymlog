Rails.application.routes.draw do

  root to: "pages#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }

  resources :profiles
  resources :users, only: [:show]
  resources :photos, only: [:create, :destroy] do
    collection do
      get :list
    end
  end

  get 'manage-profile/:id/judge' => 'profiles#judge', as: 'manage_profile_judge'
  get 'manage-profile/:id/basics' => 'profiles#basics', as: 'manage_profile_basics'
  get 'manage-profile/:id/goals' => 'profiles#goals', as: 'manage_profile_goals'
  get 'manage-profile/:id/photos' => 'profiles#photos', as: 'manage_profile_photos'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
