Rails.application.routes.draw do
  get "/points", to: "locations#index"
end
