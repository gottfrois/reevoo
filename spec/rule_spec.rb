# @author Pierre-Louis Gottfrois http://fr.linkedin.com/in/pierrelouisgottfrois/

require 'rule'

describe Rule do

  it { should respond_to(:item).with(0).arguments }
  it { should respond_to(:item=).with(1).arguments }
  it { should respond_to(:proc).with(0).arguments }
  it { should respond_to(:proc=).with(1).arguments }

  describe "#initialize" do

    context "with arguments" do

      let(:item) { Item.new }
      let(:proc) { lambda {|x| x} }

      subject { Rule.new(item, proc) }

      its(:item) { should eq(item) }
      its(:proc) { should eq(proc) }

    end

    context "without arguments" do

      subject { Rule.new }

      its(:item) { should be_nil }
      its(:proc) { should be_nil }

    end

  end

end
