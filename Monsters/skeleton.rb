require_relative '../world'

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