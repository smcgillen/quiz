Quiz::Application.routes.draw do
resources :questions, :exams, :home, :answers, :attempts

resources :users
	root :to => 'home#index'

	get '/login' => 'session#new'
	post '/login' => 'session#create'
	get '/logout' => 'session#destroy'

	get '/about' => 'home#about'

	get '/works' => 'home#works'

	get '/contact' => 'home#contact'

end
