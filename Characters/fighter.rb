require_relative 'character'
require_relative '../world'
class Fighter < Character

  def will_save
    stat_bonus(:wisdom) + 0
  end

  def dex_save
    stat_bonus(:dexterity) + 1
  end

  def con_save
    stat_bonus(:constitution) + 2
  end


end