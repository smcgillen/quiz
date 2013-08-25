Quiz::Application.routes.draw do

  resources :questions, :exams, :home, :answers, :attempts
  resources :exams, :home, :answers, :attempts do
    collection do
        get '/chart/:exams', :action => 'chart'
      end
    end

<<<<<<< HEAD
  resources :users

     root :to => 'home#index'

     get '/login' => 'session#new'
     get '/login' => 'session#create'
     get '/logout' => 'session#destroy'
=======
	get '/login' => 'session#new'
	post '/login' => 'session#create'
	get '/logout' => 'session#destroy'
	get '/about' => 'home#about'
	get '/quizzes' => 'home#quizzes'
	get '/works' => 'home#works'
	get '/contact' => 'home#contact'

  root :to => 'home#index'

  post '/search/' => 'home#search'


>>>>>>> 07dbd046a14bbbb9d577d8b843679c76c472de77
end

