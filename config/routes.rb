Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines, only: [:show]

  patch "/machines/:machine_id/snacks", to: "machine_snacks#update"
end
