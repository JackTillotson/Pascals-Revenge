require_relative 'character'
class Wizard < Character

  def weapon_up(weapon, dx, stat_num)
    set_weapon(weapon)
    set_damage(dx)
    raise_stat(:intelligence, stat_num)
  end

  def armor_up(armor, ac, value, value2)
    set_armor(armor)
    set_ac(ac)
    lower_stat(:dexterity, value)
    raise_stat(:intelligence, value2)
  end

  def will_save
    stat_bonus(:intelligence) + 2
  end

  def dex_save
    stat_bonus(:dexterity) + 0
  end

  def con_save
    stat_bonus(:constitution) + 0
  end

end