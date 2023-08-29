# frozen_string_literal: true

class IngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create update]
  include PaginationMethods
  def index
    @ingredients = Ingredient.all.limit(limit).offset(offset)
    # $redis.set('my_key', 52)
    # val = $redis.get('my_key')
    # render plain: "Value set in Redis! #{val}"
    render json: { ingredients: @ingredients, pagination: pagination(Ingredient.count) }, formats: :json
  end

  def show
    @ingredient = Ingredient.find_by(name: params[:id])
    render json: @ingredient
  end

  def ingredients_running_low
    @ingredients = Ingredient.where(status: %w[running_low out_of_stock])
    render json: @ingredients
  end

  def basic_ingredients
    @ingredients = Ingredient.where(is_basic: true)
    render json: @ingredients
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      render json: { status: 'Success' }, status: :created
    else
      render json: { errors: @ingredient.error_messages }, status: :unprocessable_entity
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      render json: { status: 'Success' }, status: :ok
    else
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def ingredient_params
    categories_id = Category.find_by(name: params['ingredient'][:category]).id
    units_id = Unit.find_by(name: params['ingredient'][:unit]).id
    params_hash = params.require(:ingredient).permit(:name, :quantity, :status, :is_basic,
                                       :is_family_favorite)
    params_hash[:categories_id] = categories_id
    params_hash[:units_id] = units_id
    params_hash
  end
end
