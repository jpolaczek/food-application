class Section < ApplicationRecord
  belongs_to :recipe

  has_many :components, dependent: :destroy

  accepts_nested_attributes_for :components
  validates :name, presence: true
end
