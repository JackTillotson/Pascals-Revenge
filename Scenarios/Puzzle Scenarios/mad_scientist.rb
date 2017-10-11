require_relative '../../world'

class MadScientist
  def intro
    puts "You enter a stone laboratory full of expensive looking equipment and Tesla coils.
Beakers and flasks line the shelves along the walls filled with strange liquids.
A voice cackles “Oh wonderful, a new brain for my latest creation!”
It’s a frail but insane looking mad scientist!
He begins to slowly creep up to you with a very painful looking syringe,
you better convince him he doesn’t want your brain!"
  end

  def action
    World.prompt.select 'What do you do?' do |actions|
      actions.choice "'Umm... 2+2 = 5?'", -> {puts "Mad Scientist: Why does it always have to be an idiot that wanders into my lab?....
Go away! Leave me Alone!"}
      actions.choice "That's some tasty looking bleach you have over there!", -> {puts "To prove your point, you run over to the bleach and take a swig.
It costs you 2 points of health, but the mad scientist just looks at you in revulsion and returns to work."
      World.champion.lose_health(2)}
      actions.choice "#{World.champion.name}: 'I can fit my whole fist in my mouth!'",
                     -> {World.prompt.select 'Mad Scientist: Do it then! I dare you!' do |choices|
                       choices.choice 'Attempt to put your fist in your mouth.',
                                      -> {puts "The mad scientist laughs hysterically as he watches you attempt to eat your own fist.
Mad Scientist: Hahaha, alright moron! You can go!"}
                       choices.choice "Show some class and don't eat your own hand.", -> {puts "Mad Scientist: I knew you were bluffing...
\nHe stabs you with a syringe and everything goes dark...."
                       abort('GAME OVER.')}
                     end}
      actions.choice "#{World.champion.name}: 'I'm gonna beat the crap out of you, you pasty old twig!",
                     -> {puts ("You swing your #{gear_to_s(World.champion.weapon)} at the Scientist but he quickly takes a swig of a potion.
You notice his muscles start to ripple and bulge mid swing.
He catches your #{gear_to_s(World.champion.weapon)} in his hand.
His muscles continue to expand until he looks far beyond the strongest man you've ever seen.
He takes a step closer to you until his chest is nearly against your face.
He begins to peck dance.
Each bounce causes another bone in your face to fracture until he is satisfied with the damage he has wrought!
You take 5 damage!
Mad Scientist: You're lucky I rattled your brain so much that it won't even be useful to me! Why don't you just get out of here?")
                     World.champion.lose_health(5)}
    end
  end

  def outro
    puts 'You walk out of the room pondering if all this is really worth the treasure of Balanar...'
  end

end