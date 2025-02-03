require 'rails_helper'

RSpec.describe Gift, type: :model do
  it "is valid with a name" do
    gift = Gift.new(name: "Test Gift")
    expect(gift).to be_valid
  end

  it "is invalid without a name" do
    gift = Gift.new(name: nil)
    expect(gift).not_to be_valid
  end
end