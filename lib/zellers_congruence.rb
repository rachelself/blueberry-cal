class ZellersCongruence
  def self.calculate(year, month, day = 1)
    q = day

    if month == 1
      y = year - 1
      m = 12 + month
    elsif month == 2
      y = year - 1
      m = 12 + month
    elsif
      y = year
      m = month
    end
    h = (q + (((m + 1)*26)/10).floor + y + (y/4).floor + 6 * (y/100).floor + (y/400).floor) % 7
    return h
  end
end
