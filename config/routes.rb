Rails.application.routes.draw do
  root 'phones#index'
  post 'create' => 'phones#create'
end
