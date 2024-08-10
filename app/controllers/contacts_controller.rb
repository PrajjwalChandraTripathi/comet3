class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(flat_contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Contact was successfully created.' }
        format.turbo_stream   # Add this line to handle JavaScript response
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form_container", partial: 'contacts/form', locals: { contact: @contact }) }
      end
    end
  end

  private

  def flat_contact_params
    params.permit(:candidate_name, :father_name, :phone_number, :email_id, :course_interest, :college, :query)
  end
end
