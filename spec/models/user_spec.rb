require 'spec_helper'

describe User do 
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password)}
  it {should validate_presence_of(:full_name)}
  it {should validate_presence_of(:email)}
  it {should have_many(:queue_items).order("position ASC")}
  it {should have_many(:reviews).order("created_at DESC")}
  it {should have_many(:following_relationships).class_name('Relationship').with_foreign_key('follower_id') }

  describe "#queued_video?" do 
    it "returns true when the user queued the video" do 
      user = Fabricate(:user)
      video = Fabricate(:video)
      Fabricate(:queue_item, user: user, video: video)
      expect(user.queued_video?(video)).to be_truthy
    end

    it "returns false when the user hasn't queued the video" do 
      user = Fabricate(:user)
      video = Fabricate(:video)
      expect(user.queued_video?(video)).to be_falsey
    end

  describe "#follows?"
    it "returns true if the user has a following relationship with another user" do 
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      Fabricate(:relationship, leader: bob, follower: alice)
      expect(alice.follows?(bob)).to be_truthy
    end

    it "returns false if the user does not have a following relationship with another user" do 
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      Fabricate(:relationship, leader: alice, follower: bob)
      expect(alice.follows?(bob)).to be_falsey
    end 
  end
end