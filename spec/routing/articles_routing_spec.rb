require "rails_helper"

RSpec.describe ArticlesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/articles").to route_to("articles#index")
    end

    it "routes to #create" do
      expect(:post => "/articles").to route_to("articles#create")
    end
  end
end
