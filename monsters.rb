require_relative 'world'

class Monster

  def initialize
    @health = 10
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
    10
  end

end

class Minotaur < Monster

  def initialize
    @health = 25
  end

  def name
    'Minotaur'
  end

  def armor_value
    16
  end

  def attack
    World.dice.roll_d20 + 5
  end

  def do_damage
    World.dice.roll_d12 + 2
  end

  def miss_text
    text = ["The minotaur's loincloth catches a breeze and reveals his extremely tiny manhood. He stops mid swing to fix his wardrobe malfunction.",
            "The minotaur hits you but your #{gear_to_s(World.champion.armor)} deflects the blow.",
            "The minotaur attempts to strike you but you dodge out of the way narrowly avoiding contact.",
            "The minotaur attempts to hit you but you move out of the way easily avoiding the blow.",
            "The minotaur swings at you but deflect the blow with your #{gear_to_s(World.champion.weapon)}."]
    num = rand(0..4)
    text[num]
  end

  def hit_text(damage)
    text = ["The minotaur headbutts you for #{damage} damage!",
            "The minotaur swings his axe at you dealing #{damage} damage!",
            "The minotaur trips you with his axe and pile drives you, doing #{damage} damage! Ouch!",
            "The minotaur twists your nipples hard, doing #{damage} damage!",
            "The minotaur punches you straight in the gut for #{damage} damage!"]
    num = rand(0..4)
    text[num]
  end

  def start_text
    ["You make your way down a disgusting slimy tunnel and enter a room lined with foreign paintings from floor to ceiling,
Inside the room you notice a minotaur sitting down on a bench enjoying the views. He grumbles to himself as you walk in,
he pulls a lever sealing the entrance behind you. He stand up and bellows at you as he charges."]
  end

end

class Skeleton < Monster

  def name
    'Skeleton'
  end

  def miss_text
    text = ["The skeleton hits you but your #{gear_to_s(World.champion.armor)} deflects the blow.",
            "The skeleton attempts to strike you but you dodge out of the way narrowly avoiding contact.",
            "The skeleton attempts to hit you but you move out of the way easily avoiding the blow.",
            "The skeleton claws at you but deflect the blow with your #{gear_to_s(World.champion.weapon)}."]
    num = rand(0..3)
    text[num]
  end

  def hit_text(damage)
    text = ["The skeleton claws you for #{damage} damage!",
            "The skeleton swings his bony fist at you dealing #{damage} damage!"]
    num = rand(0..1)
    text[num]
  end

  def start_text
    ['You venture down a hallway covered in dust and cobwebs. Magical torches light the way.
Ancient sarcophagi lay broken in your path. You have to step over them as you continue on.
You begin to hear a scraping almost shuffling noise as a skeleton comes into your view. You attack.']
  end
end