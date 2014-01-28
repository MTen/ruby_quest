require 'rspec'
require_relative "../monster"
require_relative "../hero"

describe "In battle" do
  before do
    @slime = Slime.new
  end
  describe Hero do
    before do
      @hero = Hero.new
    end
    describe "after hitting a slime" do
      before do
        @hero.bludgeonfist @slime
      end
      it "should not have killed the slime" do
        @slime.should be_active
      end
      it "should have been counterattacked" do
        @hero.toughness.should == 8
      end
      describe "and then hitting it again" do
        before do
          @hero.bludgeonfist @slime
        end
        it "should have killed the slime" do
          @slime.should_not be_active
        end
        it "should not have been counterattacked" do
          @hero.toughness.should == 8
        end
      end
    end
  end
end
