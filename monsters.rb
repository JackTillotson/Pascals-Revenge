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
as you get closer you see he is attempting to repoduce the pictures on the wall on his own canvas. How sweet."]
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
            "The skeleton claws at you but you deflect the blow with your #{gear_to_s(World.champion.weapon)}."]
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
You begin to hear a scraping almost shuffling noise as a skeleton comes into your view.']
  end
end

class Goblin < Monster

  def name
    'Goblin'
  end

  def miss_text
    text = ["The goblin's rusty spear hits you but your #{gear_to_s(World.champion.armor)} deflects the blow.",
            "The golbin gets distracted by his cooking rat and spends his turn turning the meat instead of attacking.",
            "The goblin attempts to hit you but you move out of the way easily avoiding the blow.",
            "The goblin stabs at you but you deflect the blow with your #{gear_to_s(World.champion.weapon)}."]
    num = rand(0..3)
    text[num]
  end

  def hit_text(damage)
    text = ["The goblin stabs you for #{damage} damage!",
            "The skeleton swings his rusty spear at you dealing #{damage} damage!"]
    num = rand(0..1)
    text[num]
  end

  def start_text
    ["The crypt begins to smell of dung and rotting meat as you approach a particularly filthy section of halls.
You notice more and more discarded scraps of food and tools as you progress through the hall.
You soon see a light ahead that looks different from the torches on the walls.
It's a campfire! You see a goblin roasting what looks to be a large rat on a stick."]
  end

end

class MutatedRatPerson < Monster

  def name
    'Mutated Rat Person'
  end

  def miss_text
    text = ["The Mutated Rat's claws hit you but your #{gear_to_s(World.champion.armor)} deflects the blow.",
            "The Mutated Rat smells cheese in the air and for a second he almost looks peaceful.
It distracts him long enough to give you a a chance to attack.",
            "The Mutated Rat attempts to hit you but you move out of the way easily avoiding the blow.",
            "The Mutated Rat bites at you but you punch his face away."]
    num = rand(0..3)
    text[num]
  end

  def hit_text(damage)
    text = ["The Mutated Rat bites you for #{damage} damage!",
            "The Mutated Rat's claws dig into you dealing #{damage} damage!"]
    num = rand(0..1)
    text[num]
  end

  def start_text
    ['You venture down a wide tunnel into what looks to be an ancient sewer system. The air smells foul and dank but you press on.
The only light comes from glowing moss on the walls but it remains slightly difficult to see. Up ahead you hear gnawing and splashing.
You creep ahead slowly attempting to keep your feet dry and avoiding splashing to stay hidden.
You see a giant mutated rat humanoid which appears to be the source of the noise.']
  end

end