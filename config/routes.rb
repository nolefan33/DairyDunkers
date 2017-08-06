Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', as: 'edit_admin_registration'
    patch 'admins' => 'devise/registrations#update', as: 'admin_registration'
  end

  get 'admin' => "admin#landing", as: :admin_root
  post 'admin/create'

  get 'cookies/:id' => "cookies#show", as: :show_cookie
  post 'cookies/create'

  post "home/signup"
  root to: "home#index"
end
