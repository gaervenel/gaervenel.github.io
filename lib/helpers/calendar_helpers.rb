module CalendarHelpers

  def solstice? month, day
    (month == 7 && day == 4) || (month == 13 && day == 9)
  end

  def equinox? month, day
    (month == 4 && day == 2) || (month == 10 && day == 7)
  end

  def rest? day, period
    period == 'Lens' && day % 2 == 0
  end

end
