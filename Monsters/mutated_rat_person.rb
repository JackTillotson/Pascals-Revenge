require_relative '../world'

class MutatedRatPerson < Monster

  def name
    'Mutated Rat Person'
  end

  def miss_text
    text = ["The Mutated Rat's claws hit you but your #{gear_to_s(World.champion.armor)} deflects the blow.",
            "The Mutated Rat smells cheese in the air and for a second he almost looks peaceful.
It distracts him long enough to give you a chance to attack.",
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