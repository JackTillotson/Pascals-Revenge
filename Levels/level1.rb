require_relative '../world'
require_relative '../Characters/character'
require_relative '../Characters/fighter'
require_relative '../Characters/wizard'
require_relative '../Characters/rogue'
puts "You arrive at the border of Dunathal, tired and hungry from your journey.
You see a small bug floating annoyingly close to you... Almost like it's watching you.\n\n"

bug_action = World.prompt.select('What do you do?') do |stuff|
  stuff.choice 'Swat it', 1
  stuff.choice 'Attempt to eat it', 2
  stuff.choice 'Ignore it', 3
  stuff.choice 'Talk to it', 4
end

if bug_action == 1
  puts 'Please stop trying to hit me!'
elsif bug_action == 2
  puts 'Who does that you weirdo?'
elsif bug_action == 3
  puts 'Excuse me!'
elsif bug_action == 4
  puts "You: Hello Mr. Bug.\nBug: Oh an adventurer with manners! How pleasant, I think I'll
enjoy traveling with you!"
end

puts "\n\nI am Pascal!\nWelcome to the land of Dunathal Adventurer!
So you seek the treasure of the great Crypt Lord Balanar?
Well of course... Why else would you approach certain death?\n
Just kidding! You'll be fine! Promise!
But enough of that! What's your name? Not that it really matters... They never live long enough for me to use it.
Oh sorry about that! Just kidding again! I hear this place is pretty safe!"
name = World.prompt.ask('What is your name adventurer?', required: true)

puts "\n\nPascal: Well nice to meet you Mr. #{name}! Hey look at that I used your name! For the first and last time...\n"

_class = World.prompt.select('What class will you be dying as today?') do |classes|
  classes.choice 'Fighter', :fighter
  classes.choice 'Wizard', :wizard
  classes.choice 'Rogue', :rogue
end

if _class == :fighter
  World.champion Fighter.new(_class, name)
elsif _class == :wizard
  World.champion Wizard.new(_class, name)
elsif _class == :rogue
  World.champion Rogue.new(_class, name)
end

puts "\n\nOh woopidy freaking doo look everybody we got a badass #{_class} over here!\n
Well if I wasn't a bug I would rip your limbs off and turn you into a mindless zombie forever living in pain!!!\n
I mean umm... That's cool, I like #{_class}s as much as the next guy."

World.prompt.select('Shall we move on?') do |stuff|
  stuff.choice "Hell no we ain't moving on!", -> {abort("Pascal: Fine you panzy!\nGAME OVER.")}
  stuff.choice 'I suppose so...'
  stuff.choice "LET'S DO IT!"
end

puts "\n\nyou make your way towards the ancient crypts. Every step leads you further into a darkening landscape more
desolate and cruel than you have ever witnessed before. Pascal the bug promised it was safe... Can you trust him?"

World.prompt.select('Do you trust Pascal?') do |response|
  response.choice 'Yes'
  response.choice 'No', -> {World.prompt.select("\n#{World.champion.name}: Pascal I don't trust you... What's your game?
Pascal: My game?! Woah woah woah what's with the hostilities?
I thought we were friends? I'm here trying to help you get rich!
Now can we continue or do you have more insults for me?") do |q|
    q.choice "Fine, let's go.", -> {puts('Pascal: Thank you!')}
    q.choice "You expect me to believe you are here to help me get rich? Tell me the truth!",
             -> {World.prompt.select("Pascal: What are you gonna do if I don't #{World.champion.name}?...") do |stuff|
      stuff.choice 'Attempt to squish Pascal.', -> {if World.dice.roll_d20 == 20
                                                      abort('You squish Pascal, feeling his guts ooze out his little
 bug body. Then you feel something else... The ground starts to shake. All of a sudden the land around you explodes.
 You feel shrapnel shredding your body and the sting of icy cold begins to gnaw at your heart. Your vision darkens and
 You feel no more...
 GAME OVER')
                                                    else
                                                      puts "You swat at Pascal but he easily avoids you.
Pascal: You having a seizure or are you trying to hit me? Either way you suck at it!\n"
                                                    end}
      stuff.choice 'Keep walking.', -> {puts "Pascal: That's what I thought..."}
    end}
   end}
 end

puts "Soon you arrive at the broken gates of a crumbling wall. Grave stones and cobwebs dot the land,
every bone in your body tells you to turn around and run but you press on. You arrive at a massive staircase
leading down into the earth. A giant slab off to the side used to cover the entrance. Based on the vines growing over it
and the excess decay it has been some time since it was moved.\n"

World.prompt.select("Pascal: Are you ready #{World.champion.name}?", ('Enter the Crypt.'))

World.prompt.select( "Pascal: Woah wait! What is that you're wearing?") do |outfit|
  if World.champion._class == :fighter
    outfit.choice 'Full Plate Armor', -> {World.champion.armor_up(:full_plate, 19, 4)}
    outfit.choice 'Chainmail Armor', -> {World.champion.armor_up(:chainmail, 17, 2)}
    outfit.choice 'Leather Armor', -> {World.champion.armor_up(:leather, 15, 0)}
  elsif World.champion._class == :wizard
    outfit.choice 'Wizard Robes', -> {World.champion.armor_up(:robes, 12, 0, 2)}
    outfit.choice 'Leather Armor', -> {World.champion.armor_up(:leather, 15, 0, 0)}
    outfit.choice 'My Birthday Suit', -> {World.champion.armor_up(:birthday_suit, 9, 0, 5)}
  elsif World.champion._class == :rogue
    outfit.choice 'Extremely Tight Revealing Leather Armor', -> {World.champion.armor_up(:extremely_tight_leather, 15, 1)}
    outfit.choice 'Fish Net Clothing', -> {World.champion.armor_up(:fish_nets, 13, 3)}
    outfit.choice 'I am lathered in Bear Grease', -> {World.champion.armor_up(:bear_grease, 11, 5)}
  end
end

puts 'Oh lovely...'
World.prompt.select("Well what about your weapon? What have you got hidden away in your #{gear_to_s(World.champion.armor)}?") do |weapon|
  if World.champion._class == :fighter
    weapon.choice 'A Greatsword', -> {World.champion.weapon_up(:greatsword, 12, 1, 0)}
    weapon.choice 'Shortswords', -> {World.champion.weapon_up(:shortswords, 6, 2, 0)}
    weapon.choice 'A Really Big Stick', -> {World.champion.weapon_up(:really_big_stick, 10, 1, 2)}
  elsif World.champion._class == :wizard
    weapon.choice 'A Wizard Staff', -> {World.champion.weapon_up(:wizard_staff, 6, 1, 0)}
    weapon.choice 'A Stupid Little Wand', -> {World.champion.weapon_up(:stupid_little_wand, 3, 1, 1)}
    weapon.choice 'The Lunch My Mom Packed Me.', -> {World.champion.weapon_up(:lunch, 1, 1, 2)}
  elsif World.champion._class == :rogue
    weapon.choice 'Daggers', -> {World.champion.weapon_up(:daggers, 3, 3, 0)}
    weapon.choice 'Hand Axes', -> {World.champion.weapon_up(:hand_axes, 5, 2, 0)}
    weapon.choice 'A Dull Spoon', -> {World.champion.weapon_up(:dull_spoon, 2, 4, 1)}
  end
end

puts "\nPascal: So let me get this straight... You're a #{World.champion._class} named #{World.champion.name},
with your #{gear_to_s(World.champion.weapon)} for a weapon,
wearing #{gear_to_s(World.champion.armor)} for armor and these stats#{World.champion.stats}?
Yikes... Good luck to us.
You descend the stairs. The air becomes foul and damp as you make your way down.
Pascal: The crypts are ever changing and the monsters and traps that exist in these halls cannot be predicted.
Keep moving forward and eventually you will reach the tomb of Balanar where great treasure and power awaits you.

You enter a small room lined with lichen and small plants growing in the cracks of the old stone.
On the floor there is a brown leather pack covered in cobwebs.
Pascal flies down and takes a peek inside.
Pascal: Oh goody! Health potions! Take these with you to aid you in the crypts.
You reach down and take the potions out of the bag. You find 3 health potions and place them in your inventory."
World.prompt.select('Pascal: How many potions do you have now?') do |choices|
  choices.choice 'This makes 3.', -> {puts 'Pascal: You idiot! You came here with no potions?!'}
  choices.choice 'Enough.', -> {puts "Pascal: Good, you'll need them."}
end
puts "You ignore Pascal and open the ancient wooden door that leads into the crypt.
.
.
.
.
.
Good luck Hero.\n"

10.times do
  next_scenario
end

puts 'STAGE 1 COMPLETE'