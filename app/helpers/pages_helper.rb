module PagesHelper
  def age
    t = Time.new
    day = 9;
    month = 7
    year = 1996
    age = t.year - year
    if t.month - month < 0 || t.day - day < 0
      age = age - 1
    end
    age
  end
end
