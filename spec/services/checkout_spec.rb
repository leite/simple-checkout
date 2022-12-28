require 'spec_helper'

describe Checkout do

#Test data:
#Basket: GR1,SR1,GR1,GR1,CF1
#Total price expected: £22.45
#Basket: GR1,GR1
#Total price expected: £3.11
#Basket: SR1,SR1,GR1,SR1
#Total price expected: £16.61
#Basket: GR1,CF1,SR1,CF1,CF1
#Total price expected: £30.57

  describe "checkout requirements" do
    let(:green_tea)     { build :product, :green_tea }
    let(:strawberries)  { build :product, :strawberries }
    let(:coffee)        { build :product, :coffee }

    let(:pricing_rules) do
      [
        build(:price_rule, :green_tea),
        build(:price_rule, :strawberries),
        build(:price_rule, :coffee)
      ]
    end

    let(:co) { described_class.new pricing_rules }

    describe "basket: GR1, SR1, GR1, GR1, CF1" do
      before do
        co.scan green_tea
        co.scan strawberries
        co.scan green_tea
        co.scan green_tea
        co.scan coffee
      end

      describe "expects 22.45" do
        it { expect(co.total).to eq(22.45) }
      end
    end

    describe "basket: GR1, GR1" do
      before do
        co.scan green_tea
        co.scan green_tea
      end

      describe "expects 3.11" do
        it { expect(co.total).to eq(3.11) }
      end
    end

    describe "basket: SR1, SR1, GR1, SR1" do
      before do
        co.scan strawberries
        co.scan strawberries
        co.scan green_tea
        co.scan strawberries
      end

      describe "expects 16.61" do
        it { expect(co.total).to eq(16.61) }
      end
    end

    describe "basket: GR1, CF1, SR1, CF1, CF1" do
      before do
        co.scan green_tea
        co.scan coffee
        co.scan strawberries
        co.scan coffee
        co.scan coffee
      end

      describe "expects 30.57" do
        it { expect(co.total).to eq(30.57) }
      end
    end
  end
end
