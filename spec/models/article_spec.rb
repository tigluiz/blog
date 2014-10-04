require 'rails_helper'

RSpec.describe Article, :type => :model do
  it { should validate_presence_of(:description) }
  it { should have_many(:comments) }
end
