require 'rails_helper'

RSpec.describe "IngredientsControllers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ingredients"
      expect(response).to have_http_status(:success)
    end

    it "returns the number of records specified by per_page" do
      ingredients = Ingredient.create([{ name: "Rice"}, {name: "Arhar Dal"}, {name: "Moong Dal dhuli"}])
      get "/ingredients?per_page=2&page=1"
      expect(JSON.parse(response.body)["ingredients"].length).to eq(2)
    end

    it "returns the correct records for the page specified" do
      ingredients = Ingredient.create([{ name: "Rice"}, {name: "Arhar Dal"}, {name: "Moong Dal dhuli"}])
      get "/ingredients?per_page=2&page=2"
      expect(JSON.parse(response.body)["ingredients"][0]["name"]).to eq(ingredients[2][:name])
    end
  end
end
