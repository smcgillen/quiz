Quiz::Application.routes.draw do
resources :questions, :exams, :home, :answers, :attempts

resources :users


   root :to => 'home#index'
end


# git remote add origin https://github.com/smcgillen/quiz.git
# git push -u origin master