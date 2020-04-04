Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#get 'my_contacts/index', as: 'contacts'
#get 'my_contacts/new', as: 'new_contact'
#post 'my_contacts/create', as: 'create_contact'
#get 'my_contacts/:id/edit', to: 'my_contacts#edit', as: 'edit_contact'
#patch 'my_contacts/:id/update', to: 'my_contacts#update', as: 'update_contact'
#delete 'my_contacts/:id/destroy', to: 'my_contacts#destroy', as: 'destroy_contact'

resources :my_contacts, except:[:show]
root 'my_contacts#index'
end
