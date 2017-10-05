require_relative '../world'

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