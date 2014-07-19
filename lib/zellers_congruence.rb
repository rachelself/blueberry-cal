class ZellersCongruence
  def self.calculate(year, month, day = 1)
    q = day
    year

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
    puts "m is: #{m}"
    puts "day is: #{q}"
    puts "year is: #{y}"
    h = (q + (((m + 1)*26)/10).floor + y + (y/4).floor + 6 * (y/100).floor + (y/400).floor) % 7
    puts "h is #{h}"
    return h
  end
end
