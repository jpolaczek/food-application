require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'relationships' do
    it { should belong_to :recipe }
    it { should have_many :components }
  end
end
