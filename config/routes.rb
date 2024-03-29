ArtupWeekend::Application.routes.draw do
  resources :event_applications

  root :to => 'posts#index'

  resources :events, only: [:show, :update, :new, :edit, :create, :destroy]
  
  match '/materials', :to => 'materials#index', :as => "materials"
  match '/bring_artup_to_your_city', :to => 'materials#services', :as => "services"
  match '/FAQ', :to => 'materials#faq', :as => "faq"
  match '/about-us', :to => 'materials#about_us', :as => "about_us"
  match '/loi', to: 'materials#loi', as: 'loi'

  get 'tags/:tag', to: 'posts#index', as: :tag
  
  devise_for :users

  resources :sponsors, only: [:create, :destroy]
  resources :prizes, only: [:create, :destroy]
  resources :organizers, only: [:create, :destroy]
  resources :teammates, only: [:create, :destroy]

  resources :users, :only => [:show]
  match 'users/:id' => 'users#show'
  match '/users_names', :to => 'users#users_names', :as => "users_names"

  resources :posts, path: "artitup" do
    resources :comments do
      member do
        get :vote_up
        get :vote_down
      end
    end
    member do
      get :vote_up
      get :vote_down
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
