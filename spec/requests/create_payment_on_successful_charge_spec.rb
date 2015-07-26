require 'spec_helper'

describe "Create payment on successful charge", :vcr do
  let(:event_data) do
    {
      "id" => "evt_16SrhrJ4R6fOT5ApU9Ir7wvi",
      "created"=> 1437927031,
      "livemode"=> false,
      "type"=> "charge.succeeded",
      "data"=> {
        "object"=> {
          "id"=> "ch_16SrhrJ4R6fOT5ApqGBvIuBS",
          "object"=> "charge",
          "created"=> 1437927031,
          "livemode"=> false,
          "paid"=> true,
          "status"=> "succeeded",
          "amount"=> 999,
          "currency"=> "usd",
          "refunded"=> false,
          "source"=> {
            "id"=> "card_16SrhqJ4R6fOT5Ap9d6NwBF5",
            "object"=> "card",
            "last4"=> "4242",
            "brand"=> "Visa",
            "funding"=> "credit",
            "exp_month"=> 7,
            "exp_year"=> 2017,
            "fingerprint"=> "QtkPXGspjizkswkR",
            "country"=> "US",
            "name"=> nil,
            "address_line1"=> nil,
            "address_line2"=> nil,
            "address_city"=> nil,
            "address_state"=> nil,
            "address_zip"=> nil,
            "address_country"=> nil,
            "cvc_check"=> "pass",
            "address_line1_check"=> nil,
            "address_zip_check"=> nil,
            "tokenization_method"=> nil,
            "dynamic_last4"=> nil,
            "metadata"=> {},
            "customer"=> "cus_6gEAH25lTcJfkL"
          },
          "captured"=> true,
          "balance_transaction"=> "txn_16SrhrJ4R6fOT5AppYYZkE9y",
          "failure_message"=> nil,
          "failure_code"=> nil,
          "amount_refunded"=> 0,
          "customer"=> "cus_6gEAH25lTcJfkL",
          "invoice"=> "in_16SrhrJ4R6fOT5Apu5W9huND",
          "description"=> nil,
          "dispute"=> nil,
          "metadata"=> {},
          "statement_descriptor"=> nil,
          "fraud_details"=> {},
          "receipt_email"=> nil,
          "receipt_number"=> nil,
          "shipping"=> nil,
          "destination"=> nil,
          "application_fee"=> nil,
          "refunds"=> {
            "object"=> "list",
            "total_count"=> 0,
            "has_more"=> false,
            "url"=> "/v1/charges/ch_16SrhrJ4R6fOT5ApqGBvIuBS/refunds",
            "data"=> []
          }
        }
      },
      "object"=> "event",
      "pending_webhooks"=> 1,
      "request"=> "req_6gEAHZyhhQmZlA",
      "api_version"=> "2015-07-13"
    }
  end

  it "creates a payment with the webhook from stripe for succeeded" do
    post "/stripe_events", event_data
    expect(Payment.count).to eq(1)
  end

  it "creates the payment associated with the user" do
    alice = Fabricate(:user, customer_token: "cus_6gEAH25lTcJfkL")
    post "/stripe_events", event_data
    expect(Payment.first.user).to eq(alice)
  end

  it "creates the payment with the amount" do
    alice = Fabricate(:user, customer_token: "cus_6gEAH25lTcJfkL")
    post "/stripe_events", event_data
    expect(Payment.first.amount).to eq(999)
  end

  it "creates the payment with reference id" do
    alice = Fabricate(:user, customer_token: "cus_6gEAH25lTcJfkL")
    post "/stripe_events", event_data
    expect(Payment.first.reference_id).to eq("ch_16SrhrJ4R6fOT5ApqGBvIuBS")
  end
end
