require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns the number of records specified by per_page" do
      ingredients = Ingredient.create([{ name: "Rice"}, {name: "Arhar Dal"}, {name: "Moong Dal dhuli"}])
      get :index, params: {per_page: 2, page: 1}
      expect(JSON.parse(response.body)["ingredients"].length).to eq(2)
    end

    it "returns the correct records for the page specified" do
      ingredients = Ingredient.create([{ name: "Rice"}, {name: "Arhar Dal"}, {name: "Moong Dal dhuli"}])
      get :index, params: {per_page: 2, page: 2}
      expect(JSON.parse(response.body)["ingredients"][0]["name"]).to eq(ingredients[2][:name])
    end
  end

  describe "POST #create" do
    it "returns http created" do
      post :create, params: {ingredient: {name: "Rice"}}
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT #update" do
    it "returns http updated" do
      Ingredient.create( name: "Rice")
      put :update, params: {id: Ingredient.find_by(name: "Rice").id, ingredient: {is_basic: true}}
      expect(response).to have_http_status(:ok)
    end
  end

end
