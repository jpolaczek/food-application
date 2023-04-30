class Recipe < ApplicationRecord
    has_many :sections, dependent: :destroy
    has_many :instructions, dependent: :destroy
    belongs_to :user

    accepts_nested_attributes_for :sections, :instructions

    paginates_per 2

    validates :name, presence: true
end
