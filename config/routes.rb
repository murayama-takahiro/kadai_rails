Rails.application.routes.draw do
  resources :twees do
    collection do
      post :confirm
    end
  end
  root to: "twees#index"
end
