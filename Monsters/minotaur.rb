require_relative '../world'

class Minotaur < Monster

  def initialize
    @health = 20
  end

  def name
    'Minotaur'
  end

  def armor_value
    17
  end

  def attack
    World.dice.roll_d20 + 4
  end

  def do_damage
    World.dice.roll_d8 + 2
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
as you get closer you see he is attempting to repoduce the pictures on the wall on his own canvas. How sweet."]
  end

end