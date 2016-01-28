module PagesHelper
  def age
    t = Time.new
    day = 9;
    month = 7
    year = 1996
    age = t.year - year
    if t.month - month <= 0
      if t.month == month
        if t.day - day < 0
          age = age - 1
        end
      else
        age = age - 1
      end
    end
    age
  end
end
