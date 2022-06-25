promotional_rules = {
  over_60_discount: true,
  same_product_discount: true,
  promo_product: "lavanda"
}
PRODUCTS = [
  {code: 001, name: "lavanda", price: 9.25},
  {code: 002, name: "remera", price: 45.0},
  {code: 003, name: "remera", price: 19.95}
]
class Checkout
  attr_reader :items
  def initialize(promotional_rules = {})
    @promotional_rules = promotional_rules
    @items = []
  end
  def scan(code)
    PRODUCTS.each do |product|
      @items << product if product[:code] == code
    end
  end
  def total
    total = 0
    @items.each do |item|
      if @promotional_rules[:same_product_discount] # nil
        if item[:name] == @promotional_rules[:promo_product] && @items.count(item) >= 2
          total += 8.5
        else
          total += item[:price]
        end
      else
        total += item[:price]
      end
    end
    return total - (total * 0.1) if total >= 60 && @promotional_rules[:over_60_discount] != nil
    return total
  end
end

puts "-------------------------"
puts "test 1"
puts "-------------------------"
co = Checkout.new(promotional_rules)
co.scan(001)
co.scan(002)
co.scan(003)
p co.items
p co.total
puts "-------------------------"
puts "test 2"
puts "-------------------------"
co = Checkout.new(promotional_rules)
co.scan(001)
co.scan(003)
co.scan(001)
p co.items
p co.total
puts "-------------------------"
puts "test 3"
puts "-------------------------"
co = Checkout.new(promotional_rules)
co.scan(001)
co.scan(002)
co.scan(001)
co.scan(003)
p co.items
p co.total
