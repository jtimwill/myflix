require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    it "creates a session when input is valid"
    it "redirects to the sign_in path when the input is valid"
    it "does not create a session when the input is invalid"
  end

  describe "GET destroy" do
    it "resets the session to nil"
    it "redirects to root_path"
  end
end