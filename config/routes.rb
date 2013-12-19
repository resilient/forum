ForumApp::Application.routes.draw do
	resources :posts do
    resources :answers, only: [:new, :create, :edit, :update, :destroy]
	end

	devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

	root :to => 'posts#index'

  resources :topics
end
