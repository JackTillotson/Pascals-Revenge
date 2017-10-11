require_relative '../../world'
require_relative '../../Characters/character'
require_relative '../../Monsters/snail_boss_monster'
require_relative '../../Monsters/monsters'
require_relative '../fight_scenario'
require 'timeout'
require 'colorize'

def snail_race
  puts "\nYou hear a cacophony of shouts, cheers, and insults as you enter the room.
The room smells foul and is lined with banners displaying names and numbers.
A collection of banners in the middle read champion near the top.\n
Before you, a horde of monsters crowds around a central point in the giant chamber.
The discordant sounds of their cries and the presence of so many monsters fills you with unease.
You turn to leave but the door behind you is already shut.
Thankfully none of the monsters have noticed you yet."

  World.prompt.select 'What do you do?' do |choices|
    choices.choice 'Try to open the door back up.', -> {puts "You try to push the door back open but it won't budge.
You slam your shoulder into the door but still it won't budge.
Finally you take out your #{World.champion.weapon} and start hacking at the door... To no avail!
\nA couple of monsters turn around, hearing the sounds your escape attempt.
They cry, 'HUUUUUUMAN!'
\nThe noise from the monsters dies down as they all turn to stare at you.
Your heart stops beating for a moment...
Then the monsters charge at you!\n
HALT!!!
Shouts a voice from the back of the mob.
The monsters part as a large zombie like creature that looks to have been stitched together from many bodies approaches.
The creature has the rotting head of a minotaur and a body of over sized goblin parts patched together.
\nZombie Creature: Let us have some sport from the human! Allow him to race!
If he wins he goes free! If he loses... Well let's just say he doesn't want to lose.\n
The monsters cheer and drag you to the center of the room."}
    choices.choice 'Go see what all the commotion is about.',
                   -> {puts "You walk up to the crowd of monsters and try to peek over them to see but they are slightly too tall.
An ogre next to you sees you craning your neck and his eyes widen slightly.\n
Ogre: Hey man, good to see you! Just in time for the snail races!
The ogre then exclaims to the group, 'Hey guys! Steve's here! And he brought his ugly human costume!'
\nA large zombie like creature that looks to have been stitched together from many bodies stands up looming over the group.
The creature has the rotting head of a minotaur and a body of over sized goblin parts patched together.
\nZombie Creature: Barnabus you dumbass, that's a human!
The monsters begin brandishing weapons while the nearby ogre grabs you.
\nPascal says in your ear: Well I guess this is it for you dummy...\n
Zombie Creature: Wait! Let us allow him to race instead! We came here for sport did we not? If he loses, then you can kill him!
\nThe ogre takes you to the center of the group and sets you down.\n"}
    choices.choice 'Try to sneak around the edge of the room.',
                   -> { puts "You sneak to the other side of the room but when you pull on the door it doesn't open.
One of the monsters must have the key.
Just then one of the monsters turns around to sneeze and sees you standing there.
He sneezes: 'HUUUUUUMAN!'
\nThe noise from the monsters dies down as they all turn to stare at you.
Your heart stops beating for a moment...
Then the monsters charge at you!\n
HALT!!!
Shouts a voice from the back of the mob.
The monsters part as a large zombie like creature that looks to have been stitched together from many bodies approaches.
The creature has the rotting head of a minotaur and a body of over sized goblin parts patched together.
\nZombie Creature: Let us have some sport from the human! Allow him to race!
If he wins he goes free! If he loses... Well let's just say he doesn't want to lose.\n
The monsters cheer and drag you to the center of the room."}
  end

  puts "You see a set of lanes set up just like a drag race.
A small banner strung up on sticks that says 'Starting Line' hangs over one end of the tracks.
A checkered line lays at the other end, clearly a finish line.
Also sitting at the starting line you see a set of snails lined up.
A vampire with a particularly sexy mullet walks up to you and hands you an undead snail.\n
You: Why is mine... dead?
Vampire: Oh that's Isaac. He's an undead snail. Races fine, just don't make him mad.\n
You walk over to the starting line and take your place next to the other monsters racing their snails.\n
On your right is a fat yellow snail with the name 'Surprise Banana' written on it's side.\n
Immediately on your left is a green slightly misshapen snail with the name 'Booger.'\n
Finally on your far left sits a somehow extremely jacked looking red snail with the name 'Suck It.'"
  World.prompt.select 'Zombie Creature: Are you ready to hear the rules?' do |choices|
    choices.choice 'Yes.'
  end

  puts "The rules are simple really! First snail to reach the finish line wins!\n
The more you cheer on your snail the faster he will go.\n
The more you cheer your particular snail on the angrier he will get.\n
Don't let him reach 10 on the anger scale or he might hurt you.\n
Every round his anger will decrease by 1.\n
The track is also 50 inches long.\n"
  World.prompt.select 'Are you ready?' do |choices|
    choices.choice 'Yes.'
  end

  puts "The zombie creature yells: 'GO!!!'
And the race starts!"

  inches = 0
  anger = 0
  yellow = 0
  green = 0
  red = 0
  until inches >= 50 || anger >= 10 || yellow >= 50 || green >= 50 || red >= 50
    unless anger >= 0
      anger = 0
    end
    puts "\nCurrent Anger: #{anger}\n
Current Distances:
You: #{inches}/50 inches.
Surprise Banana: #{yellow}/50 inches.
Booger: #{green}/50 inches.
Suck It: #{red}/50 inches."
    World.prompt.select 'Cheer on your snail!' do |cheers|
      cheers.choice 'Cheer a little bit.',
                    -> {@speed = 2
                    @rage = 0
                    puts "You in your indoor voice: You can do it little snail.
Your snail with riveting speed moves #{@speed} inches and does not seem to be any angrier with you."}
      cheers.choice 'Cheer respectfully but loudly.',
                    -> {@speed = World.dice.roll_d6
                    @rage = World.dice.roll_d(2)
                    puts "You yell: Go! Fly like the wind you handsome young mollusc!
Your snail with blinding speed moves #{@speed} inches and increases #{@rage} anger levels!"}
      cheers.choice 'Cheer like a way too into it sports parent.',
                    -> {@speed = World.dice.roll_d12
                    @rage = World.dice.roll_d(4) + 1
                    puts "You scream: COME ON YOU CRAPPY LITTLE GASTROPOD! YOU MOVE LIKE A SLUG!
Your snail with near to light speed moves #{@speed} inches and increases #{@rage} anger levels!"}
    end
    inches += @speed
    anger += @rage
    temp_yellow = World.dice.roll_d3
    temp_green = World.dice.roll_d6
    temp_red = World.dice.roll_d8
    yellow += temp_yellow
    green += temp_green
    red += temp_red
    puts "\nSurprise Banana moves #{temp_yellow} inches!
Booger moves #{temp_green} inches!
Suck It moves #{temp_red} inches!\n"
    anger -= 1
  end

  if inches >= 50
    World.champion.stats.keys.each do |key|
      World.champion.raise_stat(key, 2)
    end
    puts "You win!!!!!!
Your stats have been raised by 2!

Pascal: About time this worthless snail did something!
The snail enrages after hearing Pascal's comment!"
  elsif anger >= 10
    puts 'You have reached 10 anger! The snail enrages at your excessive cheering!'
  else
    if yellow >= 50
      puts 'Surprise Banana Wins!!!'
    elsif green >= 50
      puts 'Booger Wins!!!'
    else
      puts 'Suck It Wins!!!'
    end
    puts 'The snail enrages from not coming in 1st!'
  end

  snail_fight

end


def snail_fight
  puts "The snail begins to grow, his shell and body expanding at an alarming rate!
The monsters in the room begin to scream and scatter.
Many are crushed beneath the behemoth of a snail that has materialized before you!

You notice some of the monsters trying to leave the room but the door is locked.
You see the key around the neck of the Zombie Creature who, at the moment,
is being turned to mush from the acidic slime produced by the giant snail.

The snail then turns his attention towards the group at the door and they all die horribly!
Their shrieks die away as the last of them passes to the void.

With the rest of the monsters either playing dead or being dead the snail turns its attention towards you!

You are far too brave to play dead and instead confront the giant snail head on!

The snail cackles at you: You insulted me and therefore shall die the slowest!
Yet because you have shown bravery I shall explain to you how this fight works!
This isn't Dark Souls okay, it's text based! I have to explain things! Anyway..."
  World.prompt.select 'Are you ready to hear the rules?' do |choices|
    choices.choice 'Yes.'
  end

  puts "Each round you will attack me. This will happen automatically.\n
Each round I will randomly summon 2 snails of 3 possible colors.
You will have the option to kill one of those snails each round OR you can do an extra attack against me.
YOU WILL ONLY HAVE 3 SECONDS TO MAKE THE CHOICE OR YOU WILL DEFAULT TO KILLING NONE.\n
The colors and their rules are as follows:
  Green: If there is an odd number of green snails you will take damage.
  Red: If there is an even number of red snails you will take damage.
  Yellow: If there is an odd number of yellow snails then the snails switch their damage properties.
  Meaning, Green snails now do damage if their number is even, and Red do damage if their number is odd.
Also in case you haven't noticed my aura cancels out magic!\n"

  World.prompt.select 'Ready to die?' do |choices|
    choices.choice 'You are the one who is going to die!'
    choices.choice 'Yes!'
    choices.choice 'No!', -> {puts 'Giant Undead Snail: Too bad!'}
  end

  green_snails = 0
  red_snails = 0
  yellow_snails = 0
  @monster = SnailBossMonster.new

  until @monster.health <= 0 || World.champion.health <= 0
    # if green_snails < 0
    #   green_snails = 0
    # end
    # if red_snails < 0
    #   red_snails = 0
    # end
    # if yellow_snails < 0
    #   yellow_snails = 0
    # end

    puts "\nBoss Health: #{@monster.health}
Your Health: #{World.champion.health}\n\n"
    2.times do
      num = rand(0..2)
      if num == 0
        green_snails += 1
        puts "The #{@monster.name} has summoned a Green Snail!\n"
      elsif num == 1
        red_snails += 1
        puts "The #{@monster.name} has summoned a Red Snail!\n"
      elsif num == 2
        yellow_snails += 1
        puts "The #{@monster.name} has summoned a Yellow Snail!\n"
      end
    end
    sleep 7

    begin
      Timeout::timeout(3) {
        World.prompt.select "\nWhat Will You Do?" do |actions|
          actions.choice "Kill A Green Snail! Alive: #{green_snails}".green,
                                     -> {if green_snails == 0
                                           puts 'There are no Green snails alive!'
                                         else
                                           "You kill a green snail! Obliterating it with your #{World.champion.weapon}"
                                           green_snails -= 1
                                         end}
          actions.choice "Kill A Red Snail! Alive: #{red_snails}".red,
                                        -> {if red_snails == 0
                                              puts 'There are no Red snails alive!'
                                            else
                                              "You kill a red snail! Obliterating it with your #{World.champion.weapon}"
                                              red_snails -= 1
                                            end}
          actions.choice "Kill A Yellow Snail! Alive: #{yellow_snails}".yellow,
                                       -> {if yellow_snails == 0
                                             puts 'There are no Yellow snails alive!'
                                           else
                                             "You kill a Yellow snail! Obliterating it with your #{World.champion.weapon}"
                                             yellow_snails -= 1
                                           end}
          actions.choice 'Extra Attack!', -> {if World.champion.attack > @monster.armor_value
                                                damage = World.champion.do_damage
                                                @monster.lose_health(damage)
                                                puts champion_hit_text(damage)
                                              else
                                                puts champion_miss_text
                                              end}
          actions.choice "Drink A Potion. Current Health: #{World.champion.health}. Potions Remaining: #{World.champion.potions}", -> {World.champion.use_potion}
        end}
    rescue => e
      puts e
      puts "\n\nChoose Faster Next Time!\n"
    end

    if green_snails % 2 == 1 && yellow_snails % 2 == 0 && green_snails != 0
      damage = 2
      puts "\nYou take #{damage} damage from the little green snails!\n"
      World.champion.lose_health(damage)
    end
    if red_snails % 2 == 0 && yellow_snails % 2 == 0 && red_snails != 0
      damage = 2
      puts "\nYou take #{damage} damage from the little red snails!\n"
      World.champion.lose_health(damage)
    end
    if green_snails % 2 == 0 && yellow_snails % 2 == 1 && green_snails != 0
      damage = 2
      puts "\nYou take #{damage} damage from the little green snails!\n"
      World.champion.lose_health(damage)
    end
    if red_snails % 2 == 1 && yellow_snails % 2 == 1 && red_snails != 0
      damage = 2
      puts "\nYou take #{damage} damage from the little red snails!\n"
      World.champion.lose_health(damage)
    end

    puts "\nYou make your auto attack!"
    if World.champion.attack > @monster.armor_value
      damage = World.champion.do_damage
      @monster.lose_health(damage)
      puts champion_hit_text(damage)
    else
      puts champion_miss_text
    end

  end

  if @monster.health <= 0
    puts 'You have defeated the Giant Undead Snail!'
  else
    abort('The Giant Undead Snail oozes his way on top of you!
Your bones are crushed and your skin begins to melt away!
GAME OVER.')
  end

end

