def trap_scenario
  traps = [:spike_trap, :dart_trap, :mind_flayer_trap]
  num = rand(0..2)
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
                                                     damage = World.dice.roll_d4
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
                                                    damage = World.dice.roll_d4
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