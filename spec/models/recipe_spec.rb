require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :sections }
    it { should have_many :instructions }
    it { should belong_to :user }
  end
end
