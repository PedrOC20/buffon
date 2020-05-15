class Api::V1::ContactsController < ApplicationController
  def index
    @clubs = Club.all

    render json: @clubs.to_json(:include => [:contacts]), status: :ok
    # render json: { status: 'SUCCESS', message: 'All Contacts', data: @contacts }, status: :ok
  end

  def show
    @contact = Contact.find(params[:id])

    render json: { status: 'SUCCESS', message: 'Contact showed', data: @contact }, status: :ok
  end

  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update(contact_params)
      render json: { status: 'SUCCESS', message: 'Conytact Updated', data: @contact }, status: :created
    else
      render json: { status: 'ERROR', message: 'Contact not updated', data: @contact.errors }, status: 400
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @club = @contact.club
    
    if @contact.destroy
      render json: { status: 'SUCCESS', message: 'Contact Deleted' }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Contact not deleted', data: @contact.errors }, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name, :email,
      :phone_number, :role,
      :importance, :description,
      :how_met, :where_met
    )
  end
end
