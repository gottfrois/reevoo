# @author Pierre-Louis Gottfrois http://fr.linkedin.com/in/pierrelouisgottfrois/

class Item
  attr_accessor :code, :label, :price

  # Initialize Item Class.
  #
  # @param [Symbol] code the item code.
  # @param [String] label the item label.
  # @param [Integer] price the item price.
  def initialize(code = nil, label = '', price = 0)
    @code, @label, @price = code, label, price
  end
end
