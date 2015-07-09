require 'spec_helper'

describe SandboxEmailInterceptor do
  describe "delivering_email" do
    before{ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)}
    after do 
      ActionMailer::Base.deliveries.clear
      Mail.unregister_interceptor(SandboxEmailInterceptor)
    end
    it "intercepts email" do 
      alice = Fabricate(:user, email: "alice@example.com")
      AppMailer.delay.send_welcome_email(alice)
      expect(ActionMailer::Base.deliveries.last.to).to eq(['test@example.com'])
    end
  end
end

