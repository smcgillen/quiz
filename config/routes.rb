Quiz::Application.routes.draw do

  resources :questions, :exams, :home, :answers, :attempts
  resources :exams, :home, :answers, :attempts do
    collection do
        get '/chart/:exams', :action => 'chart'
      end
    end

  resources :users

     root :to => 'home#index'

     get '/login' => 'session#new'
     get '/login' => 'session#create'
     get '/logout' => 'session#destroy'
end

