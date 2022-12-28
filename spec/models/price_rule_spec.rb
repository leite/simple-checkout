require 'spec_helper'

describe PriceRule do
  subject { described_class.new }

  describe "when valid model" do
    it {
      expect(subject.public_methods)
        .to(include(:code, :type, :min, :percentage_discount, :new_price))
    }
  end

  describe "when valid price_rule" do
    let(:coffee) { build :price_rule, :coffee }

    it { expect(coffee.code).to                 eq("CF1") }
    it { expect(coffee.type).to                 eq(:discount) }
    it { expect(coffee.min).to                  eq(3) }
    it { expect(coffee.percentage_discount).to  eq(0.3333) }
    it { expect(coffee.new_price).to            eq(0) }
  end
end
