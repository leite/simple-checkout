class Product < Struct.new(:code, :name, :price)
  def initialize hash = nil
    super *hash.values_at(:code, :name, :price) unless hash.nil?
  end
end
