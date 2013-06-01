# @author Pierre-Louis Gottfrois http://fr.linkedin.com/in/pierrelouisgottfrois/

class Checkout
  attr_accessor :items, :rules

  # Initialize Checkout Class.
  #
  # @param [Array] rules an array of rules to apply on items.
  def initialize(rules = [])
    @rules, @items = rules, []
  end

  # Add given item to the 'cart'.
  #
  # @param [Item] item the item to add.
  # @return [Checkout] the current instance.
  def scan(item)
    self.items << item
    self
  end

  # Compute 'cart' total price.
  # Apply given promotional rules if any.
  #
  # @return [Integer] the total price.
  def total
    return 0 if self.items.empty?
    apply_rules(self.items.map(&:price).inject(:+))
  end

  private

  # Apply each promotional rules on given price.
  #
  # @param [Integer] price the 'cart' total price before rules applied.
  # @return [Integer] the new price.
  def apply_rules(price)
    self.rules.each do |rule|
      price -= rule.proc.call(self.items.select {|item| item.code == rule.item.code}.count, rule.item.price)
    end

    price
  end
end
