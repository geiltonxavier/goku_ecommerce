
require 'spec_helper'

RSpec.describe Api::V1::AddressesController, type: :controller do

  describe "authentication" do
    context "when has token" do
      let!(:credentials) { request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(YAML.load_file('config/secrets.yml')[Rails.env]["secret_key_base"]) }
      context "when find address" do
        let(:address){ FactoryGirl.create(:address) }

        it "has a 200 status code" do
          request.accept = "application/json"
          get 'index', { address: { zip_code: address.zip_code } }

          expect(response.response_code).to eq(200)
        end
      end

      context "when address is not found code 404" do
        it "return 404" do
          request.accept = "application/json"
          get 'index', { address: { zip_code: "AAA" } }

          expect(response.response_code).to eq(404)
        end
      end
    end

    context "when hasn't token" do
      it "return unauthorized code 401" do
        request.accept = "application/json"
        get 'index', { address: { zip_code: "AAA" } }, authorization: nil

        expect(response.response_code).to eq(401)
      end
    end
  end
end