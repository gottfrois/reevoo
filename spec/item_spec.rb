# @author Pierre-Louis Gottfrois http://fr.linkedin.com/in/pierrelouisgottfrois/

require 'item'

describe Item do

  it { should respond_to(:code).with(0).arguments }
  it { should respond_to(:code=).with(1).arguments }
  it { should respond_to(:label).with(0).arguments }
  it { should respond_to(:label=).with(1).arguments }
  it { should respond_to(:price).with(0).arguments }
  it { should respond_to(:price=).with(1).arguments }

  describe "#initialize" do

    context "with arguments" do

      let(:code)  { :foo }
      let(:label) { 'Foo' }
      let(:price) { 5.00 }

      subject { Item.new(code, label, price) }

      its(:code) { should eq(code) }
      its(:label) { should eq(label) }
      its(:price) { should eq(price) }

    end

    context "without arguments" do

      subject { Item.new }

      its(:code) { should be_nil }
      its(:label) { should eq('') }
      its(:price) { should eq(0) }

    end

  end

end
