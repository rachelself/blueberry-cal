class Year

  attr_reader :year

  def initialize(year)
    @year = year
    # @year_array = @year.construct_year
  end

  def is_leap_year?
    if @year % 4 == 0
      return true if @year % 100 == 0 && @year % 400 == 0
      return false if @year % 100
    else
      false
    end
  end

  def header
    "#{@year}".center(20).rstrip
  end

  def construct_year
    arr = []
    1.upto(12) do |i|
      month = Month.new(i, @year).construct_month
      arr << month
    end
    arr
    # puts "year_array: #{arr}"
  end

  # def to_s
  #   output = header
  #   output << "\n"
  #   @year_array = @year.construct_year
  #
  #   1.upto(4) do |i|
  #     puts "inside i loop"
  #
  #     0.upto(2) do |m|
  #       # m_counter = 0
  #       puts "inside m loop"
  #       puts "this iteration: #{@year_array[m]}"
  #       # output << @year_array[m][m]
  #       # m_counter += 1
  #
  #       # 1.upto(8) do |l|
  #       #   month
  #       # end
  #     end
  #   end
  #
  #   # 1.upto(12) do |i|
  #   #   row = []
  #   #   if i % 3 || i == 1
  #   #     row = []
  #   #     # row_counter += 1
  #   #     month = Month.new(i, @year).to_s_year
  #   #     row << month
  #   #     output << row
  #   #   else
  #   #     month = Month.new(i, @year).to_s_year
  #   #     row << month
  #   #     output << month
  #   #   end
  #   # end
  #   output
  # end

end
