require_relative '../lib/zellers_congruence'
require_relative '../lib/year'

class Month

  attr_accessor :year

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  # DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def initialize(month, year)
    # puts "this is the month coming in: #{month}"
    # @total_days = DAYS[month - 1]
    @month = month
    @year = year

  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    output << <<EOS
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
EOS
    output
  end

  def length
    if @month == 2
      if @year.is_leap_year?
        @days = 29
      else
        @days = 28
      end
    else
      days = 30 + ( ( @month + (@month/8).floor ) % 2 )
      # puts "days: #{days}"
    end

    # start_position = ZellersCongruence.calculate(@year, @month)
    start_position = 0
    first_line_length = 7 - (start_position - 1)
    remaining_days = days - first_line_length

    remainder = remaining_days % 7
    middle_lines = (remaining_days - remainder) / 7

    if remaining_days % 7
      length = middle_lines + 2
    else
      length = middle_lines + 1
    end
    # puts "length: #{length}"
    return length
  end

  # if @month == 2
  #   if @year.is_leap_year?
  #     puts "its a leap year!"
  #   end
  # else
  #   month_starts_on = ZellersCongruence.calculate(2012, 1)
  #   first_line_length = 7 - (month_starts_on - 1)
  #   remaining_days = @total_days - first_line_length
  #   last_line_length = remaining_days % 7
  #   lines_after_first_line = (remaining_days - last_line_length) / 7
  #   length = (lines_after_first_line) + 1
  #
  #
  #   puts "month starts on day: #{month_starts_on}"
  #   puts "the month is: #{@month}"
  #   puts "total days for this month: #{@total_days}"
  #   puts "first_line_length: #{first_line_length}"
  #   puts "remaining_days: #{remaining_days}"
  #   puts "last_line_length: #{last_line_length}"
  #   puts "lines_after_first_line: #{lines_after_first_line}"
  #   puts "length: #{length}"
  #   return length
  #
  #
  # end


end
