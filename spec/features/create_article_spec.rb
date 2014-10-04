require 'rails_helper'
describe "Create a article with success", :type => :feature do
    before :each do
      Article.create([description: "article one", description: "article two"])
    end
  scenario "When submit to a new article" do
    visit root_path
    within("#new_article") do
      fill_in 'article_description', with: "Some text"
    end
    click_on("Submit Query")
    expect(page).to have_content 'Some text'
  end
  scenario "When articles are already create, needs position" do
    visit root_path
    expect(page).to_not have_content '0.'
    expect(page).to have_content '1.'
  end
end
