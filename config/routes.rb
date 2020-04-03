Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'my_contacts/index', as: 'contacts'
get 'my_contacts/new', as: 'new_contact'
post 'my_contacts/create'
root 'my_contacts#index'
end
