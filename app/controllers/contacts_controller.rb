class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(:firstName)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.firstName = params[:contact][:firstName]
    @contact.lastName = params[:contact][:lastName]
    @contact.company = params[:contact][:company]
    @contact.phone1 = params[:contact][:phone1]
    @contact.phone2 = params[:contact][:phone2]
    @contact.email = params[:contact][:email]
    @contact.address1 = params[:contact][:address1]
    @contact.address2 = params[:contact][:address2]
    @contact.city = params[:contact][:city]
    @contact.state = params[:contact][:state]
    @contact.zipcode = params[:contact][:zipcode]
    @contact.notes = params[:contact][:notes]
    @contact.user = current_user

    if @contact.save
      flash[:notice] = "Contact was saved."
      redirect_to @contact
    else
      flash.now[:alert] = "There was an error saving the contact. Please try again."
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.firstName = params[:contact][:firstName]
    @contact.lastName = params[:contact][:lastName]
    @contact.company = params[:contact][:company]
    @contact.phone1 = params[:contact][:phone1]
    @contact.phone2 = params[:contact][:phone2]
    @contact.email = params[:contact][:email]
    @contact.address1 = params[:contact][:address1]
    @contact.address2 = params[:contact][:address2]
    @contact.city = params[:contact][:city]
    @contact.state = params[:contact][:state]
    @contact.zipcode = params[:contact][:zipcode]
    @contact.notes = params[:contact][:notes]

    if @contact.save
      flash[:notice] = "Contact was updated."
      redirect_to @contact
    else
      flash.now[:alert] = "There was an error saving the contact. Please try again."
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      flash[:notice] = "\"#{@contact.firstName} #{@contact.lastName}\" was successfully deleted."
      redirect_to contacts_path
    else
      flash.now[:alert] = "There was an error deleting the contact. Please try again."
      render :show
    end
  end
end
