require_relative '../world'

class Monster

  def initialize
    @health = 12
  end

  def attack
    World.dice.roll_d20
  end

  def lose_health(damage)
    @health -= damage
  end

  def health
    @health
  end

  def do_damage
    World.dice.roll_d6
  end

  def armor_value
    12
  end

  def name
    'Monster'
  end

end