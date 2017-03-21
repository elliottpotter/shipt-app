Rails.application.routes.draw do
  post  'order_products/create'

  get   'orders/new'
  get   'orders/index'
  post  'orders/create'
  put   'orders/update'

  get   'products/index'
  post  'products/create'

  get   'categories/new'
  post  'categories/create'

  post  'customers/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
