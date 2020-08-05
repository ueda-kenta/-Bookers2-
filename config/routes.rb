Rails.application.routes.draw do
  get 'users/show'
	root to: 'top#top'
	get 'top/about' => 'top#about'
	devise_for :users
	resources :users, only: [:show, :edit, :update,:create]
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
