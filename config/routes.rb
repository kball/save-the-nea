Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get "/:state_slug/:congressional_district_number" => "congressional_districts#show"

  get "/zip" => "zipcodes#search"

  root to: "zipcodes#index"

end
