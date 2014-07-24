require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do
  context ".calculate" do
    it "returns day of the week for 0" do
      ZellersCongruence.calculate(2014, 7, 5).should == 7
    end
  end

  context ".calculate" do
    it "returns day of the week for 0 in February" do
      ZellersCongruence.calculate(2014, 2, 1).should == 7
    end
  end

  context ".calculate" do
    it "returns day of the week, 3, for a 6-week January" do
      ZellersCongruence.calculate(2016, 1, 4).should == 2
    end
  end

  context ".calculate" do
    it "returns day of the week, 3, for a 4-week Feb" do
      ZellersCongruence.calculate(2015, 2, 7).should == 7
    end
  end

  context ".calculate" do
    it "returns day of the week, 0, for July that starts Sat" do
      ZellersCongruence.calculate(2017, 7, 1).should == 7
    end
  end

  context ".calculate" do
    it "returns day of the week, 1, for Jan that starts Sun" do
      ZellersCongruence.calculate(2017, 1, 1).should == 1
    end
  end

  context ".calculate" do
    it "returns day of the week, 0, for Wed Feb 2000" do
      ZellersCongruence.calculate(2000, 2, 1).should == 3
    end
  end

end
