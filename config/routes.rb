Quiz::Application.routes.draw do

  resources :questions, :exams, :home, :answers, :attempts
  # resources :home do
  #   collection do
  #       get '/chart/:exams', :action => 'chart'
  #     end
  #   end

  resources :users



     root :to => 'home#index'

	get '/login' => 'session#new'
	post '/login' => 'session#create'
	get '/logout' => 'session#destroy'
	get '/about' => 'home#about'
	get '/quizzes' => 'home#quizzes'
	get '/works' => 'home#works'
	get '/contact' => 'home#contact'

  root :to => 'home#index'

  post '/search/' => 'home#search'


end

