require_relative '../lib/year'

RSpec.describe Year do
  context ".is_leap_year?" do
    it "returns false for a normal year " do
      Year.new(2013).leap?.should be_falsey
    end

    it "returns true for regular leap years" do
      Year.new(2008).leap?.should be_truthy
    end

    it "returns false for century (non)leap years" do
      Year.new(1900).leap?.should be_falsey
    end

    it "returns true for quad-century leap years" do
      Year.new(2000).leap?.should be_truthy
    end
  end
end
