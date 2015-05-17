require 'spec_helper'

 describe Video do
  it {should belong_to(:category)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should have_many(:reviews).order("created_at DESC")}

  describe "search_by_title" do
    it "returns empty array if no match" do
      futurama = Video.create(title: "Futurama", description: "Space Travel!")
      back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel!")
      expect(Video.search_by_title("hello")).to eq([])
    end

    it "returns array of one video for exact match" do 
     futurama = Video.create(title: "Futurama", description: "Space Travel!")
     expect(Video.search_by_title("Futurama")).to eq([futurama])
    end

    it "returns array of one video for partial match" do
      futurama = Video.create(title: "Futurama", description: "Space Travel!")
      expect(Video.search_by_title("ur")).to eq([futurama])
    end

    it "returns array of all matches ordered by created_at" do
      back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel!") 
      futurama = Video.create(title: "Futurama", description: "Space Travel!",  created_at: 1.day.ago) 
      expect(Video.search_by_title("Futur")).to eq([back_to_the_future, futurama])
    end

    it "returns empty array for search with empty string" do
      back_to_the_future = Video.create(title: "Back to the Future", description: "Time Travel!") 
      futurama = Video.create(title: "Futurama", description: "Space Travel!",  created_at: 1.day.ago) 
      expect(Video.search_by_title("")).to eq([])
    end
  end
end


