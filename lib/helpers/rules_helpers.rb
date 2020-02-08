module RulesHelpers

  DICE_CODE_REGEX = /(\d*)d(\d+)([+-])?(\d*)/

  def mod score
    (score - 10) / 2
  end

  def avg dice
    matches = DICE_CODE_REGEX.match(dice)
    count = (matches[1] || 1).to_i
    sides = matches[2].to_i
    raise "Invalid dice code #{dice}" unless sides
    modifier = case matches[3]
               when '-' then -matches[4].to_i
               when '+' then matches[4].to_i
               else 0
               end
    (count * sides) / 2 + modifier
  end

end
