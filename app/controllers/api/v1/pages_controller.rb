class Api::V1::PagesController < ApplicationController
  def daily
    @players = Player.all

    render :daily, status: :ok 
  end
end