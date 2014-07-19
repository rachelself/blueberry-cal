class Year

  def initialize(year)
    @year = year
  end

  def is_leap_year?
    if @year % 4 == 0
      return true if @year % 100 == 0 && @year % 400 == 0
      return false if @year % 100
    else
      false
    end
  end

end



# if @year % 100
#   return false
# else
#   if @year % 400 == 0
#     return true
#   end
# end
