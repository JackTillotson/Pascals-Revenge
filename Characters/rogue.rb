require_relative 'character'
class Rogue < Character

  def attack
    World.dice.roll_d20 + stat_bonus(:dexterity)
  end

  def armor_up(armor, ac, value)
    set_armor(armor)
    set_ac(ac)
    raise_stat(:dexterity, value)
  end

  def will_save
    stat_bonus(:wisdom) + 0
  end

  def dex_save
    stat_bonus(:dexterity) + 2
  end

  def con_save
    stat_bonus(:constitution) + 0
  end


end