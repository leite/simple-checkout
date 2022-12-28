class BasketItem < Struct.new(:code, :name, :price, :total_price, :quantity)
  def initialize hash = nil
    init hash unless hash.nil?
  end

  def add product
    init product if code.nil?
    return false unless code == product.code

    !!quantity = quantity || 0 + 1
  end

  private

  def init hash
    super *hash.values_at(:code, :name, :price)
  end
end
