class MyContactsController < ApplicationController

    def index
      if params[:group_id] && !params[:group_id].empty?
        #@my_contacts = MyContact.where(group_id: params[:group_id]).page(params[:page])
        @my_contacts = Group.find(params[:group_id]).my_contacts.page(params[:page])
      else
          @my_contacts = MyContact.page(params[:page])
      end


    end

end
