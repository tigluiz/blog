require 'rails_helper'
describe "Create a article with success" do
  scenario "When submit to a new article" do
    visit root_path
    within("#new_article") do
      fill_in 'article_description', with: "Some text"
    end
    click_on("Submit Query")
    expect(page).to have_content 'Some text'
  end
end
