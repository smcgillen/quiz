Quiz::Application.routes.draw do
resources :questions, :exams, :home, :answers, :attempts

resources :users, :except => [:new]


   root :to => 'home#index'

   get '/register' => 'users#new'
   get '/login' => 'session#new'
   get '/login' => 'session#create'
   get '/logout' => 'session#destroy'
end
