class Api::V1::ContactsController < ApplicationController
  before_action :check_if_admin?, only: [:destroy]

  def index
    begin
      @clubs = Club.all

      render json: { status: 'SUCCESS', message: 'Contacts', data: @clubs.as_json(:include => [:contacts]) }, status: :ok
    rescue StandardError => e
      render json: {message: e.message, status: 500}
    end
  end

  def show
    begin
      @contact = Contact.find(params[:id])

      render json: { 
        status: 'SUCCESS',
        message: 'Contact',
        data: @contact.as_json(
          include: [
            user: {only: [:username, :picture]},
            club: {only: [:name, :logo]}
          ]
        )
      }, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {message: e.message, status: 500}
    end
  end

  def update
    @contact = Contact.find(params[:id])
    
    if @contact.update(contact_params)
      render json: { status: 'SUCCESS', message: 'Contact Updated', data: @contact }, status: :created
    else
      render json: { status: 'ERROR', message: 'Contact Not Updated', data: @contact.errors }, status: 400
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @club = @contact.club
    
    if @contact.destroy
      render json: { status: 'SUCCESS', message: 'Contact Deleted' }, status: 204
    else
      render json: { status: 'ERROR', message: 'Contact Not Deleted', data: @contact.errors }, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name, :email,
      :phone_number, :role,
      :importance, :description,
      :how_met, :where_met, :protected
    )
  end
end
