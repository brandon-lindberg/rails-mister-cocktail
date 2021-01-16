Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   resources :cocktails, only: %i[new create index show destroy] do 
    resources :doses, only: [:new, :create]
   end
   resources :doses, only: :destroy
end
