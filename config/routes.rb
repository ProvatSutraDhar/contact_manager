Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'my_contacts/index', as: 'contacts'
root 'my_contacts#index'
end
