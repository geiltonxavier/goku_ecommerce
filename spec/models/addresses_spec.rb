require "spec_helper"

RSpec.describe Address, :type => :model do

  subject { FactoryGirl.build(:address) }

  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:neighborhood) }
  it { should validate_presence_of(:street) }

  it { should validate_length_of(:zip_code).is_at_least(8) }
end