module TextHelpers

  IGNORE_TITLE_CASE = %w(and for from in of on or the to)

  ABILITY_SCORES = {
    str: 'Strength',
    dex: 'Dexterity',
    con: 'Constitution',
    int: 'Intelligence',
    wis: 'Wisdom',
    cha: 'Charisma',
  }

  # Capitalize each word, excluding IGNORE_TITLE_CASE words unless it's the
  # first word
  def titleize str
    str.gsub('_', ' ')
      .split(' ')
      .each_with_index
      .map { |w, i| (i > 0 && IGNORE_TITLE_CASE.include?(w)) ? w : w.capitalize }
      .join(' ')
  end

  def ordinal num
    case num
    when 1 then "#{num}<sup>st</sup>"
    when 2 then "#{num}<sup>nd</sup>"
    when 3 then "#{num}<sup>rd</sup>"
    else "#{num}<sup>th</sup>"
    end
  end

  def spell_list spells
    spells.map do |spell|
      "<span class=\"spell\">#{spell}</span>"
    end.join(', ')
  end

  def ability_name ability
    ABILITY_SCORES[ability.to_sym]
  end

end
