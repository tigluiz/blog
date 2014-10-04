require 'spec_helper'

RSpec.describe "BlackList" do
  it "remove black list words from text", :type => :model  do
    text = "Eu não sei andar de carro"
    expect(BlackList.execute(text)).to eql("Eu não sei andar de XXXX")
  end
end
