require_relative '../lib/zellers_congruence'
require_relative '../lib/year'

class Month

  # attr_accessor :days, :start_position, :first_line_length, :remaining_days, :remainder, :middle_lines, :length

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    # @year = Year.new(year)
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

    month_array = self.construct_month
    month_array.each do |sub_array|
      sub_array.each_with_index do |week, i|
        # puts "i is : #{i}"
        if i == 0
          output << week.to_s.rjust(2)
        else
          output << week.to_s.rjust(3)
        end

        # output << " "

      end
      # output << "new line"
      output << "\n"
    end
    output
  end

  # def sum(x,y)
  #   x + y
  # end
  #
  # def double_sum
  #   sum(5,6) * 2
  # end

  def total_days
    if @month == 2
      if self.is_leap_year?
        days = 29
      else
        days = 28
      end
    else
      days = 30 + ( ( @month + (@month/8).floor ) % 2 )
    end
    days
  end

  def start_position
    ZellersCongruence.calculate(@year, @month)
    # start_position = 0
  end

  def total_weeks
    start_position = self.start_position

    days = self.total_days
    # puts "Im in total_weeks - days: #{days}"

    first_line_length = 7 - (start_position)
    remaining_days = days - first_line_length
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
    length
  end

  def is_leap_year? # need to move this over to year class
    if @year % 4 == 0
      return true if @year % 100 == 0 && @year % 400 == 0
      return false if @year % 100
    else
      false
    end
  end

  def all_days
    all_days = []
    # weeks = self.total_weeks
    days = self.total_days
    blanks =  7 - self.start_position
    puts "number blanks at start: #{blanks}"

    
    # if blanks = 0
    #   blanks = 6
    # end
    # # puts "total_weeks: #{weeks}"
    # # puts "total_days: #{days}"
    # if blanks > 0
    #   blanks.times do
    #     all_days << "  "
    #   end
    # # else
    # #   6.times do
    # #     all_days << "  "
    # #   end
    # end

    days.times do |i|
      all_days << i + 1
    end
    # puts "all_days: #{all_days}"
    all_days
  end

  def construct_month
    # spaces = 6 - self.length
    # puts "spaces: #{spaces}"
    all = self.all_days
    # puts "this is all the days: #{all_days}"
    c = []
    all.each_slice(7){ |a| c<<a }
    # puts "new array: #{c}"

    c.each do |sub_array|
      if sub_array.size != 7
        # puts "less than 7!"
        # until sub_array.size == 7
        #   sub_array << "  "
        # end
      end
      until c.size == 6
        c << []
      end
    end
    # puts "new array: #{c}"
    c
  end


end
