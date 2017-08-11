Rails.application.routes.draw do
  resources :ingredients, only: [:index]
  resources :cocktails do
    resources :doses, only: [:new, :create, :edit, :update]
  end
  resources :doses, only:[:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'cocktails#index'  # we got it from the rails routes the last colum indicates teh html..
end
