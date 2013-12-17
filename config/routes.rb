ForumApp::Application.routes.draw do
	devise_for :users, path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}

	root :to => 'topics#index'

  resources :topics
end
