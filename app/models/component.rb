class Component < ApplicationRecord
  belongs_to :section

  validates :raw_text, presence: true
end
