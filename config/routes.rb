Rails.application.routes.draw do
  devise_for :users

  root :to => 'exhibitions#index'

  get 'dogs/update_varieties'
  get 'dogs/update_subvarieties'

  get 'people/:id/my_exhibitions' => 'people#my_exhibitions', :as => :people_my_exhibitions

  resources :payments, only: [:index, :new, :create, :show, :edit, :update]

  resources :exhibitions do
    resources :enrolments, only: [:new, :create, :index, :destroy]
  end

  resources :people do
    resources :dogs
    resources :exhibitions do
      resources :enrolments, only: [:new, :create, :index, :destroy]
    end
    resources :payments, only: [:index]
  end

  resources :varieties, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :subvarieties, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :breeds, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :varieties, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :subsections, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :breeds, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :sections, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :subsections, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :breeds, only: [:new, :create, :show, :edit, :update, :destroy]
  end


  resources :groups do
    resources :sections, only: [:new, :create, :show, :edit, :update, :destroy]
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
