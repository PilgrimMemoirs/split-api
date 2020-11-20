Rails.application.routes.draw do
  resources :trips do
    resources :bookings
  end
end
