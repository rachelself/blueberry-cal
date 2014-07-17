class ZellersCongruence
  def self.calculate(month, day, year)
    m = month
    q = day

    if month == 1 || month == 2
      y = year - 1
    else
      y = year
    end
    puts "m is: #{m}"
    puts "day is: #{q}"
    puts "year is: #{y}"
    h = (q + (((m + 1)*26)/10).floor + y + (y/4).floor + 6 * (y/100).floor + (y/400).floor) % 7
    puts "h is #{h}"
    return h
  end
end
