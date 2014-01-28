require 'rspec'
require_relative '../hero'

describe Hero do
  before do
    @hero = Hero.new
  end
  it "should have the toughness" do
    @hero.toughness.should == 11
    @hero.should be_active
  end
  it "should have the hostility" do
    @hero.hostility.should == 3
  end
  it "should be able to take a hit" do
    @hero.welcome_pain 4
    @hero.toughness.should == 7
    @hero.should be_active
  end
  it "should go down under a rain of awful blows" do
    6.times {@hero.welcome_pain 2}
    @hero.toughness.should == 0
    @hero.should_not be_active
  end
end
