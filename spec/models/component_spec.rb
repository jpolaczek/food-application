require 'rails_helper'

RSpec.describe Component, type: :model do
  it { should validate_presence_of :raw_text }
  it { should belong_to :section }
end
