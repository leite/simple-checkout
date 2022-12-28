class BasketItem < Struct.new(:code, :name, :price, :total_price, :quantity)
  def initialize hash = nil
    super *hash.to_h.values_at(:code, :name, :price) + [0, 1] unless hash.nil?
  end

  def add product
    return false unless code == product.code

    !!self.quantity = (quantity || 0) + 1
  end
end
