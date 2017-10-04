require_relative '../world'
require_relative '../monsters'
require_relative '../Characters/character'
#TODO: order of fight:
# Intro fight text
    # e.g. "You make your down a disgusting slimy tunnel and enter a room lined with foreign paintings from floor to ceiling,
    # Inside the room you notice a minotaur sitting down on a bench enjoying the views. He grumbles to himself as you walk in
    # and pulls a lever sealing the entrance behind you. He stand up, bellows at you and charges."
# The fight itself
# After fight text
    # e.g. "You leave the corpse of the "Monster" behind you as you casually stroll further into the bowels of the crypt."

def fight_scenario
  @monster = new_monster
  intro_text
  if World.champion._class == :wizard
    wizard_fight
  else
    regular_fight
  end
  exit_text
end

def intro_text
  puts @monster.start_text
end

def exit_text
  puts "You leave the corpse of the #{@monster.name} behind you as you casually stroll further into the bowels of the crypt."
end

def wizard_fight
  @player_armor = World.champion.armor_value
  max_armor = @player_armor + 8
  turn = 'player'
  @shield_count = 0
  until @monster.health < 1 or World.champion.health < 1
    if turn == 'player'
      if @shield_count != 0
        @shield_count -= 1
      else
        @player_armor = World.champion.armor_value
      end
      puts "\n#{World.champion.name}'s turn!"
      World.prompt.select('Your Actions:') do |actions|
        actions.choice 'Attack!', -> {if World.champion.attack > @monster.armor_value
                                        damage = World.champion.do_damage
                                        @monster.lose_health(damage)
                                        puts champion_hit_text(damage)
                                      else
                                        puts champion_miss_text
                                      end}
        actions.choice 'Fireball', -> {if World.champion.attack > @monster.armor_value
                                         damage = World.champion.fireball
                                         @monster.lose_health(damage)
                                         puts World.champion.fireball_hit_text(damage)
                                       else
                                         puts World.champion.fireball_miss_text
                                       end}
        #TODO: How to re-ask this question if they are at max armor without skipping a turn?
        actions.choice "Magic Shield: Lasts three turns, Max one stack. Turns left: #{@shield_count}.", -> {if @player_armor >= max_armor
                                                                                                           puts 'You are already at maximum armor'
                                                                                                         else
                                                                                                           @player_armor += World.champion.magic_shield
                                                                                                           @shield_count = 3
                                                                                                           puts "Your Armor was raised to #{@player_armor}"
                                                                                                         end}
        actions.choice 'Lightning Bolt', -> {if World.champion.attack > @monster.armor_value
                                               damage = World.champion.lightning_bolt
                                               @monster.lose_health(damage)
                                               puts World.champion.lightning_bolt_hit_text(damage)
                                             else
                                               puts World.champion.lightning_bolt_miss_text
                                             end}
        actions.choice 'Ice Blast', -> {if World.champion.attack > @monster.armor_value
                                          damage = World.champion.ice_blast
                                          @monster.lose_health(damage)
                                          puts World.champion.ice_blast_hit_text(damage)
                                          if rand(0..1) == 0
                                            @frozen = true
                                            puts "The #{@monster.name} was frozen for a turn!"
                                          end
                                        else
                                          puts World.champion.ice_blast_miss_text
                                        end}
        actions.choice "Drink Potion. Current Health: #{World.champion.health}. Potions Remaining: #{World.champion.potions}", -> {World.champion.use_potion}
      end
      turn = 'monster'
      if @frozen == true
        turn = 'player'
      end
    else
      puts "\n#{@monster.name}'s turn!"
      if @monster.attack > @player_armor
        damage = @monster.do_damage
        World.champion.lose_health(damage)
        puts @monster.hit_text(damage)
      else
        puts @monster.miss_text
      end
      turn = 'player'
    end
  end
  if @monster.health < 1
    puts "You have slain the #{@monster.name}!"
  else
    abort("You have been slain by the #{@monster.name}!
Pascal screams in frustration as your vision fades and you slip away into the void.
GAME OVER.")
  end
end

def regular_fight
  turn = 'player'
  until @monster.health < 1 or World.champion.health < 1
    if turn == 'player'
      puts "\n#{World.champion.name}'s turn!"
      World.prompt.select('Your Actions:') do |actions|
        actions.choice 'Attack!', -> {if World.champion.attack > @monster.armor_value
                                       damage = World.champion.do_damage
                                       @monster.lose_health(damage)
                                       puts champion_hit_text(damage)
                                     else
                                       puts champion_miss_text
                                     end}
        actions.choice "Drink Potion. Current Health: #{World.champion.health}. Potions Remaining: #{World.champion.potions}", -> {World.champion.use_potion}
      end
      turn = 'monster'
    else
      puts "\n#{@monster.name}'s turn!"
      if @monster.attack > World.champion.armor_value
        damage = @monster.do_damage
        World.champion.lose_health(damage)
        puts @monster.hit_text(damage)
      else
        puts @monster.miss_text
      end
      turn = 'player'
    end
  end
  if @monster.health < 1
    puts "You have slain the #{@monster.name}!"
  else
    abort("You have been slain by the #{@monster.name}!
Pascal screams in frustration as your vision fades and you slip away into the void.
GAME OVER.")
  end
end

def new_monster
  monsters = [Minotaur.new, Skeleton.new, Goblin.new]
  num = rand(0..2)
  monsters[num]
end

def champion_hit_text(damage)
  text = ["You swing your #{gear_to_s(World.champion.weapon)} at the #{@monster.name} cutting deep into its flesh dealing #{damage} damage!",
          "You decide to go old school and holstering your #{gear_to_s(World.champion.weapon)}, you grab the #{@monster.name} and perform a perfect suplex doing #{damage} damage!",
          "You mercilessly beat the #{@monster.name} with your fists dealing #{damage} damage!",
          "You feint low and instead bring your #{gear_to_s(World.champion.weapon)} high bringing it down on the #{@monster.name}'s head doing #{damage} damage to the creature!",
          "You unbalance the #{@monster.name} with a well placed kick and slice across dealing #{damage} damage!",
          "With a great show of strength you roundhouse kick the #{@monster.name} to the ground and bring down your #{gear_to_s(World.champion.weapon)} on top of it doing #{damage} damage!",
          "Blood splatters across the floor as your #{gear_to_s(World.champion.weapon)} connects with the #{@monster.name} dealing #{damage} damage!"]
  num = rand(0..6)
  text[num]
end

def champion_miss_text
  text = ["You swing your #{gear_to_s(World.champion.weapon)} but it narrowly misses the #{@monster.name}.",
          "You barely miss the #{@monster.name}.",
          "The #{@monster.name} deflects your blow."]
  num = rand(0..2)
  text[num]
end

def fireball_hit_text(damage)
  puts ["A fireball explodes out of your hand engulfing the #{@monster.name} dealing #{damage} damage!"]
end

def fireball_miss_text
  puts ["You shoot the fireball towards the #{@monster.name} but at the last second it ducks under the torrent of fire."]
end

def lightning_bolt_hit_text(damage)
  puts ["A bolt of lightning screams from your open palm hitting the #{@monster.name} full force in the chest doing #{damage} damage!"]
end

def lightning_bolt_miss_text
  puts ["Your lightning bolt narrowly misses the #{@monster.name}!"]
end

def ice_blast_hit_text(damage)
  puts ["You generate a raging ball of ice and wind which you send towards the #{@monster.name} striking it with incredible force dealing #{damage} damage!"]
end

def ice_blast_miss_text
  puts ["Your blast of ice side stepped by the #{@monster.name} missing it completely."]
end
