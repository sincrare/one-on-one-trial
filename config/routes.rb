Rails.application.routes.draw do
  root to: "loggedin/question_boards#index"
  get "login/index"

  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks",
  }

  namespace :loggedin do
    resources :question_boards do
      resources :answer_boards, only: %i(new create)
    end
  end

  resources :answer_boards, param: 'token', only: %i(show edit update)

  mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
