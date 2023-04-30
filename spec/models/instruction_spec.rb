require 'rails_helper'

RSpec.describe Instruction, type: :model do
  describe 'validations' do
    it { should validate_presence_of :display_text }
  end
end
