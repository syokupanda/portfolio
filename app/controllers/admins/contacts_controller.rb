class Admins::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    if @contact.is_permit == true
      @contact.update(status: 1)
    else
      @contact.update(status: 2)
    end
    redirect_to admins_contact_path(@contact.id)
  end


  private

  def contact_params
    params.require(:contact).permit(:user_id, :is_permit, :category, :status, :return_text)
  end
end
