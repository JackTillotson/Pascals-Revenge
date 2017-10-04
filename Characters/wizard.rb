require_relative 'character'
require_relative '../world'
class Wizard < Character

  def weapon_up(weapon, dx, a_num, stat_num)
    set_weapon(weapon)
    set_damage(dx)
    raise_stat(:intelligence, stat_num)
    @attack_nums = a_num
  end

  def armor_up(armor, ac, value, value2)
    set_armor(armor)
    set_ac(ac)
    lower_stat(:dexterity, value)
    raise_stat(:intelligence, value2)
  end

  def attack
    World.dice.roll_d20 + stat_bonus(:intelligence)
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

  def fireball
    World.dice.roll_d12 + stat_bonus(:intelligence)
  end

  def magic_shield
    4
  end

  def lightning_bolt
    World.dice.roll_d4 + World.dice.roll_d4 + World.dice.roll_d4 + stat_bonus(:intelligence)
  end

  #Chance to skip monster's turn
  def ice_blast
    World.dice.roll_d6
  end

end