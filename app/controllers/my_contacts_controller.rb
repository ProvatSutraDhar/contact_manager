class MyContactsController < ApplicationController

    def index
        if params[:group_id] && !params[:group_id].empty?
          #@my_contacts = MyContact.where(group_id: params[:group_id]).page(params[:page])
          @my_contacts = Group.find(params[:group_id]).my_contacts.order(created_at: :desc).page(params[:page])
        else
            @my_contacts = MyContact.order(created_at: :desc).page(params[:page])
        end
    end

    def new
      @my_contact = MyContact.new
    end

    def create
      @my_contact = MyContact.new(contact_params)
        if @my_contact.save
            flash[:success]= "Contact save successfully."
             redirect_to contacts_path
          else
            render 'new'
        end
    end

    def edit
      @my_contact =MyContact.find(params[:id])
    end

    def update
      @my_contact =MyContact.find(params[:id])
        if @my_contact.update(contact_params)
          flash[:success]= "Contact updated successfully."
            redirect_to contacts_path
        else
          render 'edit'
        end
    end

    def destroy
        @my_contact =MyContact.find(params[:id])
        if @my_contact.destroy
        flash[:danger]= "Contact has deleted!"
          redirect_to contacts_path
        else
          flash[:danger]= "Something went wrong!"
            redirect_to contacts_path  
        end


    end
    private

    def contact_params
      params.require(:my_contact).permit(:name,:email,:phone,:company,:address, :group_id, :avatar)

    end

end
