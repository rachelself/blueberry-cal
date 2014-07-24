class Year

  attr_reader :year
  attr_accessor :year_array

  def initialize(year)
    @year = year
    @year_array = self.construct_year
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
    "#{@year}".center(62).rstrip
  end

  def construct_year
    print_year = []
    1.upto(12) do |i|
      month = Month.new(i, @year)
      print_year << month
    end
    print_year
  end

  def year_header
    "#{name}".center(20).rstrip
  end

  def month_headers
    mh = []
    11.times do |i|
      mh << @year_array[i].name
    end
    mh
  end

  def week_days
    wd = ""
    3.times do |i|
      wd << "Su Mo Tu We Th Fr Sa  "
    end
    wd << "\n"
    # puts "wd: #{wd}"
  end

  def to_s
    # puts "this is year_array: #{@year_array}"
    output = header
    output << "\n\n"

    0.upto(2) do |j|
      output << month_headers[j].center(20)
      output << "  "
    end
    output << "\n"
    output << week_days

    month = @year_array[1].construct_month
    first_line = month[0]
    # puts "month: #{month}"
    # puts "first_line: #{first_line}"

    0.upto(5) do |l| #prints lines

      0.upto(2) do |i| # prints each month

        month = @year_array[i].construct_month
        next_line = month[l]


        puts "next_line: #{next_line}"
        # puts "month: #{month}"
        # puts "first_line: #{first_line}"

        0.upto(6) do |d| # prints each day of the week
          # puts "d is: #{first_line[d]}"
          output << next_line[d].to_s.center(3)

        end
        output << " "


      end
      output << "\n"
    end
    output
  end

  # def to_s
  #   puts "year_array: #{@year_array}"
  #   output = header
  #   output << "\n"
  #   # year_array = @year.construct_year
  #   # year_array = year_array[0]
  #   # puts "@year_array: #{@year_array}"
  #   1.upto(3) do |r|
  #     # 1.upto(1) do |m|
  #       name = Month.new(r, @year).name
  #       output << name
  #
  #     # end
  #
  #   end
  #   output << "\n"
  #
  #   1.upto(3) do |w|
  #     output << "\nSu Mo Tu We Th Fr Sa\n"
  #   end
  #   output
  # end


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
