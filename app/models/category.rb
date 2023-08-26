class Category < ApplicationRecord
    has_many :ingredients, foreign_key: "categories_id"
end