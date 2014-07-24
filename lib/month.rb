require_relative '../lib/zellers_congruence'
require_relative '../lib/year'

class Month

  attr_accessor :days

  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  WEEK_LENGTH = 7
  # MONTH_HEIGHT = 6
  # MONTH_WIDTH = 20
  # PADDING = 2

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

  def total_days
    if @month == 2
      if Year.new(@year).leap?
        days = 29
      else
        days = 28
        # puts "not a leap year = 28"
      end
    else
      days = 30 + ( ( @month + (@month/8).floor ) % 2 )
    end
    # puts "total days: #{days}"
    days
  end

  def start_position
    ZellersCongruence.calculate(@year, @month)
  end

  def all_days
    all_days = []
    # days = self.total_days
    # puts "start_position: #{self.start_position}"
    blanks = self.start_position - 1
    # puts "blanks: #{blanks}"

    self.total_days.times do |i|
      if i == 0 # only put blanks at start
        # if blanks > 0
        blanks.times do
          all_days << "  "
        end
        # end
      end
      all_days << i + 1 #push in the rest of the days
    end
    all_days
  end

  def construct_month
    # all = self.all_days
    # use zip?
    c = []
    self.all_days.each_slice(7){ |a| c<<a }

    until c.size == 6
      c << []
    end
    c
  end
end
