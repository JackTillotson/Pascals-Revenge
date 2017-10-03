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

end

def regular_fight
  turn = 'player'
  until @monster.health < 1 or World.champion.health < 1
    if turn == 'player'
      puts "#{World.champion.name}'s turn!"
      World.prompt.select('Your Actions:') do |actions|
        actions.choice 'Attack!', -> {if World.champion.attack > @monster.armor_value
                                       damage = World.champion.do_damage
                                       @monster.lose_health(damage)
                                       puts World.champion.hit_text(damage)
                                     else
                                       puts World.champion.miss_text
                                     end}
        actions.choice "Drink Potion. Current Health: #{World.champion.health}. Potions Remaining: #{World.champion.potions}", -> {World.champion.use_potion}
      end
      turn = 'monster'
    else
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
  monsters = [Minotaur.new, Skeleton.new]
  num = rand(0..1)
  monsters[num]
end
