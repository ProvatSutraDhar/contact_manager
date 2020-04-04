class MyContactsController < ApplicationController
    before_action :find_contact, only:[:edit, :update, :destroy]


    def index
      session[:selected_group_id] = params[:group_id]
        if params[:group_id] && !params[:group_id].empty?
          #@my_contacts = MyContact.where(group_id: params[:group_id]).page(params[:page])
          @my_contacts = Group.find(params[:group_id]).my_contacts.order(created_at: :desc).page(params[:page])
        else
            @my_contacts = MyContact.order(created_at: :desc).page(params[:page])
        end
    end

    def show

    end

    def new
      @my_contact = MyContact.new
    end

    def create
      @my_contact = MyContact.new(contact_params)
        if @my_contact.save
            flash[:success]= "Contact save successfully."
             redirect_to my_contacts_path(previous_query_string)
          else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @my_contact.update(contact_params)
          flash[:success]= "Contact updated successfully."
            redirect_to my_contacts_path(previous_query_string)
        else
          render 'edit'
        end
    end

    def destroy

        if @my_contact.destroy
        flash[:danger]= "Contact has deleted!"
          redirect_to my_contacts_path
        else
          flash[:danger]= "Something went wrong!"
            redirect_to my_contacts_path
        end


    end
    private

    def contact_params
      params.require(:my_contact).permit(:name,:email,:phone,:company,:address, :group_id, :avatar)

    end

    def find_contact
        @my_contact =MyContact.find(params[:id])
    end

    def previous_query_string

      session[:selected_group_id] ? {group_id: session[:selected_group_id]} : {}
    end

end
