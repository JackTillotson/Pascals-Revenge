def trap_scenario
  traps = [:spike_trap, :dart_trap, :mind_flayer_trap, :tar_trap]
  num = rand(0..3)
  send(traps[num])
end


# SPIKE TRAP --------------- SPIKE TRAP
def spike_trap
  spike_intro
  spike_action
  spike_outro
end

def spike_action
  World.prompt.select('What do you do?') do |choices|
    choices.choice 'Try to dodge the spikes.', -> {if World.dice.roll_d20 > (World.dice.roll_d20 + World.champion.dex_save)
                                                     damage = World.dice.roll_d4 + 1
                                                     puts "The spikes hit you dealing #{damage}!"
                                                     World.champion.lose_health(damage)
                                                     if World.champion.health < 1
                                                       abort('The spikes stab into your body piercing your heart.
at least it was a quick death.
GAME OVER.')
                                                     end
                                                   else
                                                     puts 'You jump out of the way avoiding the spike trap!'
                                                   end}
  end
end

def spike_intro
  puts 'You make your way into a narrow tunnel. The walls are covered in slime and the air is choking.
You crawl a ways through, feeling more claustrophobic as you progress each inch.
As you take your next crouched step you feel the click of a pressure plate underneath your feet.
Spikes shoot from the walls heading right towards you.'
end

def spike_outro
  puts "You crawl out of the tunnel sticky from the slime but glad you are still alive.
Pascal: Maybe don't step on pressure plates next time okay?"
end
# SPIKE TRAP --------------- SPIKE TRAP

# DART TRAP --------------- DART TRAP
def dart_trap
  dart_intro
  dart_action
  dart_outro
end

def dart_action
  World.prompt.select('What do you do?') do |choices|
    choices.choice 'Try to avoid the darts.', -> {if World.dice.roll_d20 > (World.dice.roll_d20 + World.champion.dex_save)
                                                    damage = World.dice.roll_d4 + 1
                                                    puts "The darts hit you dealing #{damage}!"
                                                    World.champion.lose_health(damage)
                                                    if World.champion.health < 1
                                                      abort('The darts pierce your jugular vein and you bleed out slowly.
GAME OVER.')
                                                    end
                                                  else
                                                    puts 'You sprint out of the room avoiding the dart trap!'
                                                  end}
  end
end

def dart_intro
  puts "You stroll into a room with wind chimes hanging from the ceiling.
So many in fact it's difficult to walk through without bumping in to them.
You lightly graze one and hear the beautiful sound of the chimes clinking against each other.
Another light pinging sound is added to the music. You notice a dart pierced the chimes you had bumped.
Suddenly a breeze begins to blow all the chimes, the music filling the air.
Darts stream from the walls as all the chimes have activated their darts!"
end

def dart_outro
  puts 'having survived the dart room you swagger on, you notice a slight head nod of approval from Pascal.'
end
# DART TRAP --------------- DART TRAP

# MIND FLAYER TRAP ------------------- MIND FLAYER TRAP
def mind_flayer_trap
  mind_flayer_intro
  mind_flayer_action
  mind_flayer_outro
end

def mind_flayer_action
  World.prompt.select('What do you do?') do |choices|
    choices.choice 'Run out of the room and take minor damage!', -> {World.champion.lose_health(2)}
    choices.choice 'Attempt to mind battle the mind flayer!', -> {if World.dice.roll_d20 + 2 > (World.dice.roll_d20 + World.champion.will_save)
                                                                    damage = World.dice.roll_d6
                                                                    puts "The mind flayer's superior power overcomes you dealing #{damage} damage!
You try to stagger out of the room before your final defeat!"
                                                                    World.champion.lose_health(damage)
                                                                    if World.champion.health < 1
                                                                      abort('The mind flayer refuses your escape and your brain explodes all over the mirrored room!
GAME OVER.')
                                                                    end
                                                                  else
                                                                    puts 'You overcome the power of the mind flayer and mentally tea bag him for good measure.'
                                                                  end}
  end
end

def mind_flayer_intro
  puts "You walk into a room covered in mirrors all pointing back at yourself.
Even when you move it seems like the mirrors all move to point back at you.
All of a sudden the image in the mirrors is no longer you.
It's the image of a mind flayer! Your brain starts to hurt immensely from his psychic attack!"
end

def mind_flayer_outro
  puts 'You exit the mirrored room wondering what horrors await you next.'
end
# MIND FLAYER TRAP ------------------- MIND FLAYER TRAP

# TAR TRAP --------------- TAR TRAP
def tar_trap
  tar_intro
  tar_action
  tar_outro
end

def tar_action
  World.prompt.select('What do you do?') do |choices|
    choices.choice 'Try to run to the exit.', -> {if World.dice.roll_d20 > (World.dice.roll_d20 + World.champion.dex_save)
                                                     damage = World.dice.roll_d4 + 1
                                                     puts "You barely escape the mire but not before the poisonous ground deals #{damage} to you!"
                                                     World.champion.lose_health(damage)
                                                     if World.champion.health < 1
                                                       abort('You try and run through the bog but the pain in your sunken limbs is overwhelming!
You slowly sink further and further into the ground all the while you feel as though your legs are on fire.
With your last breath your head sinks into the unseen ground.
Your last thoughts are of pain.
GAME OVER.')
                                                     end
                                                   else
                                                     puts 'You run through the mire nimbly keeping your feet above the surface!'
                                                   end}
  end
end

def tar_intro
  puts 'You hear a bubbling sound as you approach a dimly lit gateway.
It leads into what appears to be a swamp of some kind!
The trees are drooping and moss covered.
They looks as if any second they might reach down and grab you.
You cautiously make your way through, the only light coming from dim lanterns hung on some of the trees.
The further you progress the louder the bubbling sound becomes.
After a few minutes you see a gate exiting the forest in the distance, at the same time you notice the lanterns end where you stand.
You press on through the gloom, the only sounds are the bubbling and a pounding in your eardrums.
As you take another step you feel your foot begin to sink into the ground, then the other.
You slowly begin to sink, your feet stinging from the unseen ground.'
end

def tar_outro
  puts 'You make it to the other side of the bog, feet covered in a sticky black substance.
You walk through the gate glad to be out of the frightening forest, and continue on your journey.'
end
# TAR TRAP --------------- TAR TRAP