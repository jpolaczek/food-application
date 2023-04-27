class Recipe < ApplicationRecord
    has_many :sections
    has_many :instructions

    accepts_nested_attributes_for :sections, :instructions
end
