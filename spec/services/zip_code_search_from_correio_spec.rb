require "spec_helper"

RSpec.describe ZipCodeSearchFromCorreio, :type => :service do
  subject { ZipCodeSearchFromCorreio.new("00000-000") }

  describe ".get_address" do
    it "calls addresses from API" do
      expect(Correios::CEP::AddressFinder).to receive(:get).with("00000000")

      subject.get_address
    end
  end
end