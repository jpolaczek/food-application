class Recipe < ApplicationRecord
    has_many :sections, dependent: :destroy
    has_many :instructions, dependent: :destroy
    belongs_to :user

    accepts_nested_attributes_for :sections, :instructions
end
