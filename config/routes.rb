
Bottlenose::Application.routes.draw do
  resources :questions

  get "main/index"
  get "main/auth"
  post "main/resend_auth"
  get "main/logout"

  resources :users
  match 'users/:id/impersonate' => 'users#impersonate'

  resources :courses do
    resources :registrations, :except => [:new]
    resources :chapters
  end

  resources :registrations, :except => [:new]

  resources :chapters do
    resources :lessons
    resources :assignments
  end

  resources :assignments do
    resources :submissions, :except => [:destroy]
  end

  resources :submissions

  resources :lessons do
    resources :questions
  end

  resources :questions, :only => [:edit, :update, :destroy] do
    resources :answers, :only => [:create]
  end

  resources :answers, :only => [:destroy]
  
  root :to => 'main#index'
end
