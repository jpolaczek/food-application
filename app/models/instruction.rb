class Instruction < ApplicationRecord
  belongs_to :recipe

  scope :positioned, -> { order(:position)}

  validates :display_text, presence: true
end
