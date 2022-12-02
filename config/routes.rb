Rails.application.routes.draw do
  get "/sessions", to: "sessions#index"
  get "/sessions/:id", to: "sessions#show"
  post "/sessions/:id/stop", to: "sessions#stop"
  post "/sessions", to: "sessions#create"
  get "/points", to: "locations#index"
end
