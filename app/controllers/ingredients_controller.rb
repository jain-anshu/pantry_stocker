class IngredientsController < ApplicationController
   skip_before_action :verify_authenticity_token, only: [:create]

    def index
        @ingredients ||= Ingredient.all
        #$redis.set('my_key', 52)
        #val = $redis.get('my_key')
        #render plain: "Value set in Redis! #{val}"
        render json: @ingredients
    end
 
    def show
        @ingredient = Ingredient.find_by(name: params[:id])
        render json: @ingredient
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
          render json: {status: "Success"}, status: :created 
        else 
          render json: {errors: @ingredient.error_messages}, status: :unprocessable_entity
        end      
    end

    def update 
      @ingredient = Ingredient.find_by(name: params[:name])
      if @ingredient.update(ingredient_params)
        head :no_content 
      else 
          render json: {errors: @ingredient.error_messages}, status: :unprocessable_entity
      end      
    end  

    private
    def ingredient_params
      params.require(:ingredient).permit(:name, :categories_id, :quantity, :units_id, :status, :is_basic, :is_family_favorite)  
    end
end