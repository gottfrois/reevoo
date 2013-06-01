# @author Pierre-Louis Gottfrois http://fr.linkedin.com/in/pierrelouisgottfrois/

require 'checkout'

describe Checkout do

  it { should respond_to(:scan).with(1).arguments }
  it { should respond_to(:total).with(0).arguments }
  it { should respond_to(:items).with(0).arguments }
  it { should respond_to(:items=).with(1).arguments }
  it { should respond_to(:rules).with(0).arguments }
  it { should respond_to(:rules=).with(1).arguments }

  describe "#initialize" do

    context "with arguments" do

      let(:array) { %w(one two three) }

      subject { Checkout.new(array) }

      its(:rules) { should eq(array) }
      its(:items) { should eq([]) }

    end

    context "without arguments" do

      subject { Checkout.new }

      its(:rules) { should eq([]) }
      its(:items) { should eq([]) }

    end

  end

  describe "#scan" do

    let(:checkout)  { Checkout.new }
    let(:item)      { Item.new }

    it { expect { checkout.scan(item) }.to change { checkout.items.count }.by(1) }

  end

  describe "#total" do

    let(:checkout)  { Checkout.new }
    let(:item_1)    { Item.new(:foo, 'Foo', 2.00) }
    let(:item_2)    { Item.new(:foo, 'Foo', 3.00) }

    subject { checkout.total }

    context "without items" do

      it { should eq(0) }

    end

    context "with items" do

      before do
        checkout.scan(item_1)
        checkout.scan(item_2)
      end

      it { should eq(5.0) }

    end

  end

  describe "#apply_rules" do

    let(:fr1)       { Item.new(:fr1, 'Foo', 3.11) }
    let(:fr_rule)   { Rule.new(fr1, lambda { |quantity, price| (quantity / 2) * price }) }
    let(:checkout)  { Checkout.new }

    before do
      checkout.rules << fr_rule
      checkout.items << fr1
      checkout.items << fr1
    end

    subject { checkout.send(:apply_rules, fr1.price * 2) }

    it { should eq(3.11) }

  end

end
