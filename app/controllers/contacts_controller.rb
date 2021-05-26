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
    if @contact.save
      redirect_to contacts_path
    else
      flash[:error] = "必須項目を入力してください"
      redirect_to new_contact_path
    end
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
