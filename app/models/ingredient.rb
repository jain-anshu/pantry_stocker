# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :category, foreign_key: 'categories_id'
  belongs_to :unit, foreign_key: 'units_id'
  belongs_to :user
  scope :basic_ingredients, -> { where(is_basic: true) }
  scope :need_to_buy, -> { where(status: %w[running_low out_of_stock]) }

  enum status: {
    out_of_stock: 0,
    running_low: 1,
    in_stock: 2
  }
end
