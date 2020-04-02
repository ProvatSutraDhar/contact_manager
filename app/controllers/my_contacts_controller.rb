class MyContactsController < ApplicationController

    def index
      @my_contacts = MyContact.page(params[:page])
    end

end
