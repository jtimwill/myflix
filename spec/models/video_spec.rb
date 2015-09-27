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

  describe "rating" do
    let(:user) {Fabricate(:user)}
    let(:video) {Fabricate(:video)}

    it "returns the average rating of a video to the nearest tenth" do
      2.times {Fabricate(:review, user: user, video: video, rating: 1)}
      Fabricate(:review, user: user, video: video, rating: 3)
      expect(video.rating).to eq(1.7)
    end

    it "returns nil when a rating is not present" do
      expect(video.rating).to be_nil
    end
  end

  describe ".search", :elasticsearch do
    let(:refresh_index) do
      Video.import
      Video.__elasticsearch__.refresh_index!
    end

      context "with title" do
        it "returns no results when there's no match" do
          Fabricate(:video, title: "Futurama")
          refresh_index

          expect(Video.search("whatever").records.to_a).to eq []
        end

        it "returns an empty array when there's no search term" do
          futurama = Fabricate(:video)
          south_park = Fabricate(:video)
          refresh_index

          expect(Video.search("").records.to_a).to eq []
        end

        it "returns an array of 1 video for title case insensitve match" do
          futurama = Fabricate(:video, title: "Futurama")
          south_park = Fabricate(:video, title: "South Park")
          refresh_index

          expect(Video.search("futurama").records.to_a).to eq [futurama]
        end

        it "returns an array of many videos for title match" do
          star_trek = Fabricate(:video, title: "Star Trek")
          star_wars = Fabricate(:video, title: "Star Wars")
          refresh_index

          expect(Video.search("star").records.to_a).to match_array [star_trek, star_wars]
        end
      end
    end
  end
