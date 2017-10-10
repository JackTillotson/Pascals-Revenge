require_relative '../../world'
require_relative '../../Characters/character'
require_relative '../../Monsters/snail_boss_monster'
require_relative '../../Monsters/monsters'

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
Your snail with blinding speed moves #{@speed} inches and increases #{@rage} anger levels!"
                    inches += @speed}
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
Suck It moves #{temp_red} inches!"
    anger -= 1
  end

  if inches >= 50
    puts "You win!!!!!!
Your #{} has been raised to #{}!

Pascal: About time this worthless snail did something!
The snail enrages after hearing Pascal's comment!"
  elsif anger >= 10
    puts 'You have reached 10 anger! The snail enrages at your excessive cheering!'
  else
    puts 'The snail enrages from not coming in 1st!'
  end

  snail_fight

end


def snail_fight
  puts 'Snail Fight Test'
end