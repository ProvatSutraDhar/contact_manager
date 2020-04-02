class ContactsController < ApplicationController
def index
  @contacts =MyContact.all
end

end
