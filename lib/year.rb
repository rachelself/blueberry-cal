class Year

  attr_reader :year
  attr_accessor :year_array

  def initialize(year)
    @year = year
    @year_array = self.construct_year
  end

  def leap?
    if @year % 4 == 0
      return true if @year % 100 == 0 && @year % 400 == 0
      return true if @year % 100 != 0
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
    output = header
    output << "\n\n"

      #row 1
      0.upto(2) do |j|
        output << @year_array[j].name.center(20)
        output << "  "
      end
      output << "\n"
      output << week_days

      month = @year_array[1].construct_month
      first_line = month[0]

      0.upto(5) do |l| #prints lines

        0.upto(2) do |i| # prints each month
          month = @year_array[i].construct_month
          next_line = month[l]

          0.upto(6) do |d| # prints each day of the week
            output << next_line[d].to_s.center(3)

          end
          output << " "

        end
        output << "\n"
      end

      #row 2
      3.upto(5) do |j|
        output << @year_array[j].name.center(20)
        output << "  "
      end
      output << "\n"
      output << week_days

      month = @year_array[1].construct_month
      first_line = month[0]

      0.upto(5) do |l| #prints lines

        3.upto(5) do |i| # prints each month
          month = @year_array[i].construct_month
          next_line = month[l]

          0.upto(6) do |d| # prints each day of the week
            output << next_line[d].to_s.center(3)

          end
          output << " "

        end
        output << "\n"
      end

      #row 3
      6.upto(8) do |j|
        output << @year_array[j].name.center(20)
        output << "  "
      end
      output << "\n"
      output << week_days

      month = @year_array[1].construct_month
      first_line = month[0]

      0.upto(5) do |l| #prints lines

        6.upto(8) do |i| # prints each month
          month = @year_array[i].construct_month
          next_line = month[l]

          0.upto(6) do |d| # prints each day of the week
            output << next_line[d].to_s.center(3)

          end
          output << " "

        end
        output << "\n"
      end

      #row 4
      9.upto(11) do |j|
        output << @year_array[j].name.center(20)
        output << "  "
      end
      output << "\n"
      output << week_days

      month = @year_array[1].construct_month
      first_line = month[0]

      0.upto(5) do |l| #prints lines

        9.upto(11) do |i| # prints each month
          month = @year_array[i].construct_month
          next_line = month[l]

          0.upto(6) do |d| # prints each day of the week
            output << next_line[d].to_s.center(3)

          end
          output << " "

        end
        output << "\n"
      end



    output
  end

end
