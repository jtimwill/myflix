require 'spec_helper'

describe UsersController do 
  describe "GET new" do
    it "sets the @users variable"
    it "renders the new template"
  end

  describe "POST create" do
    it "creates the user record when input is valid"
    it "redirects to the new path when the input is valid"
    it "does not create a user when the input is invalid"
    it "renders the new template when the input is invalid"
  end
end


