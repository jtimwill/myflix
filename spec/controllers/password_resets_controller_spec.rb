require 'spec_helper'

describe PasswordResetsController do 
  describe "GET show" do 
    it "renders the show template if the token is valid" do 
      alice = Fabricate(:user)
      alice.update_column(:token, '12345')
      get :show, id: '12345'
      expect(response).to render_template :show
    end

    it "sets @token" do 
      alice = Fabricate(:user)
      alice.update_column(:token, '12345')
      get :show, id: '12345'
      expect(assigns(:token)).to eq('12345')
    end

    it "redirects to the expired token page if the token is not valid" do 
      get :show, id: '12345'
      expect(response).to redirect_to expired_token_path
    end
  end

  describe "POST create" do 
    context "with valid token and valid password" do
      it "redirects to the sign in page" do 
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(response).to redirect_to sign_in_path
      end

      it "updates the user's password" do 
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(alice.reload.authenticate('new_password')).to be_truthy
      end

      it "sets the flash success message" do
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(flash[:success]).to be_present
      end

      it "deletes the user token" do 
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:token, '12345')
        post :create, token: '12345', password: 'new_password'
        expect(alice.reload.token).to eq(nil)
      end
    end

    context "with valid token and invalid password" do 
      it "sets @token" do 
        alice = Fabricate(:user)
        alice.update_column(:token, '12345')
        post :create, token: '12345', password: ' '
        expect(assigns(:token)).to eq('12345')
      end

      it "renders the show template" do 
        alice = Fabricate(:user)
        alice.update_column(:token, '12345')
        post :create, token: '12345', password: ' '
        expect(response).to render_template :show
      end
    end

    context "with invalid token and valid password" do 
      it "redirects to the expired token path" do 
        alice = Fabricate(:user)
        alice.update_column(:token, '12345')
        post :create, token: '12', password: 'password'
        redirect_to expired_token_path
      end
    end

    context "with invalid token and invalid password" do 
      it "redirects to the expired token path" do 
        alice = Fabricate(:user)
        alice.update_column(:token, '12345')
        post :create, token: '12', password: 'some_password'
        redirect_to expired_token_path
      end
    end
  end
end

