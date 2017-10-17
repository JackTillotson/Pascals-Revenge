require_relative '../world'

class VampireSpawn < Monster

  def name
    'Vampire Spawn'
  end

  def miss_text
    text = ["The vampire spawn hits you but your #{gear_to_s(World.champion.armor)} deflects the blow.",
            "The vampire spawn attempts to strike you but you dodge out of the way narrowly avoiding contact.",
            "The vampire spawn screeches as it attempts to bite you but you move out of the way easily avoiding the blow.",
            "The vampire spawn claws at you but you deflect the blow with your #{gear_to_s(World.champion.weapon)}."]
    num = rand(0..3)
    text[num]
  end

  def hit_text(damage)
    text = ["The vampire spawn claws you for #{damage} damage!",
            "The vampire spawn digs his fangs into you dealing #{damage} damage!"]
    num = rand(0..1)
    text[num]
  end

  def start_text
    ["The air begins to smell metallic as you progress further into the crypt.
You develop a headache from the jarring stench.
The hallway you have been walking through opens into a forest with a small cabin not far from you.
You approach the cabin, it looks as if it hasn't been lived in for years.
A trail of blood leads under the door.
You hear the sound of slurping as you open the door.
A Vampire Spawn sits before you devouring a fawn.
You attack!"]
  end
end