class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(:lastName)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
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
end
