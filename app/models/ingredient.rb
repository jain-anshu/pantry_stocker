# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :category, foreign_key: 'categories_id'
  belongs_to :unit, foreign_key: 'units_id'
  belongs_to :user

  enum status: {
    out_of_stock: 0,
    running_low: 1,
    in_stock: 2
  }
end
