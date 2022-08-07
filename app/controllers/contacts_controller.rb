class ContactsController < ApplicationController
    def new
        @contact = ContactForm.new
    end
  
    def create
        @contact = ContactForm.new(params[:contact])
        @contact.request = request
        if @contact.deliver 
            redirect_to contact_url, notice: "Thank you for the message. We will contact you shorty."
        else 
            redirect_to contact_url, notice: "Can't send the message."
        end
    end
end