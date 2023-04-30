class Instruction < ApplicationRecord
  belongs_to :recipe

  scope :positioned, -> { order(:position)}
end
