require 'spec_helper'

describe Product do
  subject { described_class.new }

  describe "when valid model" do
    it { expect(subject.public_methods).to include(:code, :name, :price) }
  end

  describe "when valid product" do
    let(:strawberries) { build :product, :strawberries }

    it { expect(strawberries.code).to   eq("SR1") }
    it { expect(strawberries.name).to   eq("Strawberries") }
    it { expect(strawberries.price).to  eq(5.0) }
  end
end
