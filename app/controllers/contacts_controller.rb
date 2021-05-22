class ContactsController < ApplicationController
  def index
    @user = current_user
    @contacts = Contact.where(user_id: current_user.id)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    @user = current_user
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to contacts_path
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :is_permit, :category, :status, :title, :text, :return_text)
  end
end
