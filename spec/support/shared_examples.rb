shared_examples "require sign in" do 
  it "redirects to the sign in page" do 
    clear_current_user
    action
    expect(response).to redirect_to sign_in_path
  end
end

shared_examples "require admin" do 
  it "redirects to the home page" do 
    session[:user_id] = Fabricate(:user)
    action
    expect(response).to redirect_to home_path
  end
end

shared_examples "tokenable" do 
  describe "#generate_token!" do 
    it "generates a random token" do 
      object.generate_token!
      expect(object.token).to be_present
    end
  end

  describe "#delete_token!" do 
    it "sets the token value to nil" do 
      object.delete_token!
      expect(object.token).to be_nil
    end
  end
end