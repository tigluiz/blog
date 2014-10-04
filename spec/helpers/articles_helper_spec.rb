require 'rails_helper'

RSpec.describe ArticlesHelper, :type => :helper do
  context ".humanize_index" do
    it "start from number from 1" do
      expect(humanize_index(0)).to eql 1
    end
    it "allways increment 1, to present to user a correct index" do
      expect(humanize_index(4)).to eql 5
    end
  end
end
