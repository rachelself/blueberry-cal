require_relative '../lib/zellers_congruence'

RSpec.describe ZellersCongruence do
  context ".calculate" do
    it "returns day of the week for 0" do
      ZellersCongruence.calculate(7, 5, 2014).should == 0
    end
  end
end
