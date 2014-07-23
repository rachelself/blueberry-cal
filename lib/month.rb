require_relative '../lib/zellers_congruence'
require_relative '../lib/year'

class Month

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
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

    month_array = self.construct_month
    month_array.each do |sub_array|
      sub_array.each_with_index do |week, i|
        if i == 0
          output << week.to_s.rjust(2)
        else
          output << week.to_s.rjust(3)
        end

      end
      output << "\n"
    end
    output
  end

  # def total_days
  #   if @month == 2
  #     if self.is_leap_year?
  #       days = 29
  #     else
  #       days = 28
  #     end
  #   else
  #     days = 30 + ( ( @month + (@month/8).floor ) % 2 )
  #   end
  #   days
  # end

  def total_days
    if @month == 2
      if Year.new(@year).is_leap_year?
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
  end

  def total_weeks
    start_position = self.start_position
    days = self.total_days

    if start_position == 1
      first_line_length = 7
    elsif start_position == 7
      first_line_length = 7
    else
      first_line_length = 7 - (start_position)
    end

    remaining_days = days - first_line_length
    remainder = remaining_days % 7

    if remainder > 0
      middle_lines = ((remaining_days - remainder) / 7)
      length = middle_lines + 2
    else
      middle_lines = ((remaining_days - remainder) / 7)
      length = middle_lines + 1
    end
    # puts "days: #{days}"
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
    days = self.total_days
    blanks = self.start_position - 1

    days.times do |i|
      if i == 0
        if blanks > 0
          blanks.times do
            all_days << "  "
          end
        end
      end
      all_days << i + 1
    end
    all_days
  end

  def construct_month
    all = self.all_days
    c = []
    all.each_slice(7){ |a| c<<a }

    until c.size == 6
      c << []
    end

    c
  end


end
