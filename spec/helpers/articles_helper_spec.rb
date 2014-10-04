require 'rails_helper'

RSpec.describe ArticlesHelper, :type => :helper do
  context ".formated_id" do
    it "allways show a dot on id" do
      expect(formated_id(5)).to eql "5."
    end
  end
  context ".formated_article" do
    before do
      @article = Article.create(description: "some text")
    end

    it "return formatted article" do
      expect(formated_article(@article)).to eql("#{@article.id}. #{@article.created_at} #{@article.description}")
    end
  end
end
