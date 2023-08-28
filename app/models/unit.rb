# frozen_string_literal: true

class Unit < ApplicationRecord
  has_many :ingredients, foreign_key: 'units_id'
end
