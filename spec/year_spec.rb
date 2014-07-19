require_relative '../lib/year'

RSpec.describe Year do
  context ".is_leap_year?" do
    it "should return false for year not divisible by 4" do
      Year.new(2013).is_leap_year?.should == false
    end

    it "should return false for year divisble by 4 but not 100" do
      Year.new(2004).is_leap_year?.should == false
    end

    it "should return true for year divisble by 4 AND 100" do
      Year.new(2000).is_leap_year?.should == true
    end
  end
end
