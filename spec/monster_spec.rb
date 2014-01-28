require "rspec"
require_relative "../monster"

describe Monster do
  before do
    @monster = Monster.new
  end
  it "should be threatening" do
    @monster.howl.should == "The monster stands threateningly"
    @monster.should be_active
  end
  it "should be invincible" do
    expect {@monster.hit_for 5}.to raise_error Monster::InvincibleMonster
  end

  describe Slime do
    before do
      @slime = Slime.new
    end
    it "should be threatening" do
      @slime.howl.should == "The slime stands threateningly"
      @slime.should be_active
    end
    it "should be vulverable" do
      @slime.hit_for 5
      @slime.should_not be_active
    end
    it "should not be too be vulverable" do
      @slime.hit_for 2
      @slime.should be_active
    end
  end
end
