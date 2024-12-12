Rails.application.routes.draw do
  get "welcome/index"
  
  # Health check and PWA routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root route (you can change this to "school_years#index" if you want to use the new resource as the homepage)
  #root 'welcome#index' # FOR HELLO WORLD
  root 'school_years#index'

  # Resource routes for SchoolYear, List, and Task
  resources :school_years do
    resources :lists do
      resources :tasks
    end
  end
end
