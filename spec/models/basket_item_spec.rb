require 'spec_helper'

describe BasketItem do
  subject { described_class.new }

  describe "when valid model" do
    it {
      expect(subject.public_methods).to include(:code, :name, :price, :total_price, :quantity)
    }
  end

  describe "when valid basket_item" do
    let(:green_tea) { build :basket_item, :green_tea }

    it { expect(green_tea.code).to        eq("GR1") }
    it { expect(green_tea.name).to        eq("Green tea") }
    it { expect(green_tea.price).to       eq(3.11) }
    it { expect(green_tea.total_price).to eq(nil) }
    it { expect(green_tea.quantity).to    eq(1) }
  end

  describe "#add" do
    let(:green_tea_basket)  { build :basket_item, :green_tea }
    let(:coffee_product)    { build :product, :coffee }
    let(:green_tea_product) { build :product, :green_tea }

    it 'when fails' do
      expect(green_tea_basket.add(coffee_product)).to be false
    end

    it 'when succeds' do
      expect(green_tea_basket.add(green_tea_product)).to be true
    end
  end
end
