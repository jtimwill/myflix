# require 'spec_helper'

# describe SandboxEmailInterceptor do
#   describe "delivering_email" do
#     after {ActionMailer::Base.deliveries.clear}
#     it "intercepts email" do 
#       alice = Fabricate(:user, email: "alice@example.com")
#       email = AppMailer.send_forgot_password(alice)
#       expect(ActionMailer::Base.deliveries.last.to).not_to eq(["alice@example.com"])
#     end
#   end
# end