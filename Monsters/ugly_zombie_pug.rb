require_relative '../world'

class UglyZombiePug < Monster

  def name
    'Ugly Pug Zombie'
  end

  def miss_text
    text = ["The Zombie Pug pees on you but your #{gear_to_s(World.champion.armor)} stops the urine from making contact with you.",
            "The Zombie Pug attempts to bite you but you dodge out of the way narrowly avoiding contact.",
            "The Ugly Pug Zombie attempts to scratch you but you move out of the way easily avoiding the blow.",
            "The Zombie Pug claws at you but you deflect the blow with your #{gear_to_s(World.champion.weapon)}."]
    num = rand(0..3)
    text[num]
  end

  def hit_text(damage)
    text = ["The Ugly Pug Zombie claws you for #{damage} damage!",
            "The Zombie Pug bites your ankle dealing #{damage} damage!",
            "The Ugly Zombie Pug pees on your leg searing the flesh dealing #{damage} damage!"]
    num = rand(0..2)
    text[num]
  end

  def start_text
    ["You step down into a brightly lit room that looks like construction just began.
The floor is a good 2 feet below the threshold of the entrance and exit.
Stone blocks and other ancient work equipment sit on the ground.
You hear a slight yip and notice that at the other end of the room a small dog is attempting to climb up to the exit.
It falls over after another failed attempt to jump the 2 foot height.
Pascal laughs at the dog and it turns around and growls.
It looks to be the ugliest dog you have ever seen.
Its face is smashed into its head and it has skin hanging off its body.
Bones are visible on parts of its ribcage where the flesh is missing or torn.
It's a zombie pug! It appears hardly any uglier than a normal pug you note...
You attack!"]
  end
end