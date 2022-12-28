class Checkout
  attr_reader :rules, :basket_items

  def initialize pricing_rules
    @rules        = pricing_rules
    @basket_items = []
  end

  def scan item
    @total = nil
    index  = basket_items.find_index {|bi| bi.code == item.code }

    if index.nil?
      basket_items << BasketItem.new(item)
    else
      basket_items[index].add item
    end
  end

  def total
    @total ||= apply_rules.sum(&:total_price).round(2)
  end

  private

  def apply_rules
    @basket_items = basket_items.map do |bi|
      bi.total_price = 0

      rule = rules.find{|pr| pr.code == bi.code}
      unless rule.nil?
        case rule.type
        when :one_free
           bi.total_price = bi.price * (bi.quantity - 1) if rule.min < bi.quantity
        when :discount
          if rule.min <= bi.quantity
            if !nil_or_zero? rule.new_price
              bi.total_price = rule.new_price * bi.quantity
            elsif !nil_or_zero? rule.percentage_discount
              bi.total_price = bi.price * bi.quantity * (1 - rule.percentage_discount)
            end
          end
        end
      end

      bi.total_price = bi.price * bi.quantity if bi.total_price.zero?
      bi
    end
  end

  def nil_or_zero? v
    v.nil? || v.zero?
  end
end
