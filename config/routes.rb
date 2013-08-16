SandwichMaker::Application.routes.draw do

  resources :sandwiches, :only => [:create]
  root to: 'sandwiches#new'

end
