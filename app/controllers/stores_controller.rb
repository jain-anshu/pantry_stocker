# frozen_string_literal: true

class StoresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
    @stores = Store.all
    render json: @stores
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      render json: { status: 'Success' }, status: :created
    else
      render json: { errors: @store.error_messages }, status: :unprocessable_entity
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :distance_from_me, :phone_number, :has_online_shopping_website,
                                  :website_url, :is_available_on_instacart)
  end
end
