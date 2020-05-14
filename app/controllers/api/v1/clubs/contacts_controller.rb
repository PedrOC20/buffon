class Api::V1::Clubs::ContactsController < ApplicationController
  before_action :fetch_club

  def create
    @contact = Contact.new(contact_params)
    @contact.club = @club
    
    if @contact.save
      render json: { status: "SUCCESS", message: "Contact created", data: @contact }, status: :created
    else
      render json: { status: 'ERROR', message: 'Contact Not Saved', data: @contact.errors }, status: 422
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

  def fetch_club
    @club = Club.find(params[:club_id])
  end
end
