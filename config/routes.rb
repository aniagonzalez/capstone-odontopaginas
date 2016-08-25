Rails.application.routes.draw do
# HOME
  root 'home#index'

  get "/sites/:id/show_json" => 'build#show_json', as: 'show_json'
  get "/sites/:id/build" => 'build#build_site', as: 'build_site'

# API responses
  get "/sites/:id/team_members/render_json" => 'team_members#render_json'
  get "/sites/:id/testimonials/render_json" => 'testimonials#render_json'
  get "/sites/:id/treatments/render_json" => 'treatments#render_json'
  get "/sites/:id/gallery_pictures/render_json" => 'gallery_pictures#render_json'
  get "/sites/:id/info/render_json" => 'home#render_json'


# SESSIONS
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get '/sites/:id/additional-info' => 'sites#edit_additional_info', as: 'add_info'
  patch '/sites/:id' => 'sites#update_additional_info'
  # difficult with route matching??

  resources :sites do
    resources :team_members
    resources :gallery_pictures
    resources :testimonials
    resources :treatments
  end

end
