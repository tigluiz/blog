require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  let(:valid_attributes) {
    {description: "some thread"}
  }

  let(:invalid_attributes) {
    {bla: ""}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns the requested article as @article" do
      get :index
      expect(assigns(:article)).to be_a(Article)
    end
    it "assigns all articles as @articles" do
      article = Article.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe "POST create" do
    before(:each) do
      request.env["HTTP_REFERER"] = "http://test.host/articles"
    end
    describe "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, {:article => valid_attributes}, valid_session
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, {:article => valid_attributes}, valid_session
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it "redirects to the index" do
        post :create, {:article => valid_attributes}, valid_session
        expect(response).to redirect_to(articles_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        post :create, {:article => invalid_attributes}, valid_session
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        post :create, {:article => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
