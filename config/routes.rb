Rails.application.routes.draw do

  post '/login',to: "sessions#login"
  get  '/get_form', to: "points#get_form"
  resources :points
  post '/submit', to: "points#student_submit"
  post '/verify', to: "points#verify"
  post '/reject', to: "points#reject"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
