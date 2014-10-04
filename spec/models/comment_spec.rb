require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it { should validate_presence_of(:description) }
  it { should belong_to(:article) }
end
