Rails.application.routes.draw do
  root to: "loggedin/question_boards#index"
  get "login/index"

  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
  }

  namespace :loggedin do
    resources :question_boards
    resources :questions
  end
end
