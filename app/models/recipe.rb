class Recipe < ApplicationRecord
    has_many :sections
    has_many :instructions
end
