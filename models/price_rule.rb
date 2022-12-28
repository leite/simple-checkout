class PriceRule < Struct.new(:code, :type, :min, :percentage_discount, :new_price)
  def initialize hash = nil
    super *hash.values_at(:code, :type, :min, :percentage_discount, :new_price) unless hash.nil?
  end
end
