Rails.application.routes.draw do
  root to: "loggedin/question_boards#index"
  get "login/index"

  devise_for :users, controllers: {
      omniauth_callbacks: "users/omniauth_callbacks",
  }

  namespace :loggedin do
    resources :question_boards do
      resource :answer_boards, only: [:new, :create]
    end
  end

  resources :answer_boards, param: 'token', only: [:show, :edit, :update]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
