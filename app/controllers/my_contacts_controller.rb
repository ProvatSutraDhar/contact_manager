class MyContactsController < ApplicationController

    def index
      @my_contacts = MyContact.page
    end

end
