require 'spec_helper'

describe VideosController do
  describe "GET show" do
    it "sets the @video variable" do
      futurama = Video.create(title: "Futurama", description: "Space Travel!")
      get :show
      assigns(:video).should == futurama
    end
    it "renders the show template" do
      expect(response).to render_template :show 
    end
  end

  describe "GET search" do
    it "sets the @results variable"
    it "renders the search template" do
      expect(response).to render_template :search 
    end
  end
end