require_relative '../world'

class SnailBossMonster < Monster

  def initialize
    @health = 100
  end

  def name
    'Giant Undead Snail'
  end

  def armor_value
    16
  end

  def attack
    World.dice.roll_d20 + 1
  end

  def do_damage
    World.dice.roll_d4 + 1
  end

end