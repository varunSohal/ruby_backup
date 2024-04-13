class ContactController < ApplicationController
  def show
    @contact_page = Contact.first
  end
end
