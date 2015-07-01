require 'spec_helper'

describe ForgotPasswordsController do 
  describe "POST create" do 
    context "with blank input" do 
      before do
        post :create, email: ''
      end

      it "redirects to the forgot password page" do 
        expect(response).to redirect_to forgot_password_path
      end

      it "shows an error message" do 
        expect(flash[:error]).to eq("Email cannot be blank.")
      end
    end

    context "with existing email" do 
      before do
        Fabricate(:user, email: "joe@example.com")
        post :create, email: "joe@example.com"
      end

      it "creates a user token" do 
        alice = Fabricate(:user, email: "alice@example.com")
        post :create, email: "alice@example.com"
        expect(alice.reload.token).not_to eq(nil)
      end

      it "redirects to the forgot password confirmation page" do 
        expect(response).to redirect_to forgot_password_confirmation_path
      end

      it "sends out an email to the email address" do
        expect(ActionMailer::Base.deliveries.last.to).to eq(["joe@example.com"])
      end
    end

    context "with non-existing email" do 
      before do
        post :create, email: "foo@example.com"
      end

      it "redirects to the forgot password page" do 
        expect(response).to redirect_to forgot_password_path
      end

      it "shows an error message" do 
        expect(flash[:error]).to eq("There is no user with that email in the system.")
      end
    end
  end
end

