require 'date'

class Meetup
  attr_accessor :calendar, :selectors, :calendar_last_day

  def initialize(month, year)
    self.calendar = Date.new(year, month)
    self.calendar_last_day = Date.new(year, month, -1)
    self.selectors = {:first => 0, :second => 1, :third => 2, :fourth => 3, :last => -1}
  end

  def day(day, selector=nil)
    day = (day.to_s + "?").to_sym
    all_days_of_the_month = self.calendar.step(self.calendar_last_day).select { |d| d.send day }
    if selectors.include?(selector)
      all_days_of_the_month[selectors[selector]]
    else
      all_days_of_the_month.select do |day|
        day.mday >= 13 && day.mday < 20
      end.first
    end
  end
end