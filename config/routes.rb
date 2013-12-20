ForumApp::Application.routes.draw do
	resources :posts do
    resources :answers, only: [:new, :create]
	end

	devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

	resources :accounts, except: :show

	root :to => 'posts#index'
end
