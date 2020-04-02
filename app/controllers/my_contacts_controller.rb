class MyContactsController < ApplicationController

    def index
      @my_contacts = MyContact.all
    end

end
