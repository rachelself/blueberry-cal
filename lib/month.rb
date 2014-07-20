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
      if is_leap_year?
        @days = 29
      else
        @days = 28
      end
    else
      @days = 30 + ( ( @month + (@month/8).floor ) % 2 )

    end

    # start_position = ZellersCongruence.calculate(@year, @month)
    start_position = 0

    first_line_length = 7 - (start_position)
    remaining_days = @days - first_line_length
    remainder = remaining_days % 7

    if remainder > 0
      middle_lines = ((remaining_days - remainder) / 7)
      length = middle_lines + 2
    else
      middle_lines = ((remaining_days - remainder) / 7)
      length = middle_lines + 1
    end
    # puts "days: #{@days}"
    # puts "first_line_length: #{first_line_length}"
    # puts "remaining_days: #{remaining_days}"
    # puts "remainder: #{remainder}"
    # puts "middle_lines: #{middle_lines}"

    return length
  end

  def is_leap_year? # need to move this over to year class
    if @year % 4 == 0
      return true if @year % 100 == 0 && @year % 400 == 0
      return false if @year % 100
    else
      false
    end
  end


end
