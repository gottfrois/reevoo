# @author Pierre-Louis Gottfrois http://fr.linkedin.com/in/pierrelouisgottfrois/

class Rule
  attr_accessor :item, :proc

  # Initialize Rule Class.
  #
  # @param [Item] item the item the rule should be applied on.
  # @param [Proc] proc the procedure to call on given item.
  def initialize(item = nil, proc = nil)
    @item, @proc = item, proc
  end
end
