class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
        render json: @ingredients
    end

    def show
        @ingredient = Ingredient.find_by(name: params[:name])
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
      params.require(:ingredient).permit(:name, :categories_id, :quantity, :units_id, :status)  
    end
end