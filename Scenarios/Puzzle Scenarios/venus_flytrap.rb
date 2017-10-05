require_relative '../../world'

class VenusFlytrap

  def intro
    puts "You enter a granite stone room with vines coating the walls and floor.
The vines seem to be holding the room up as much as the stones themselves with how much they've grown into the slabs.
At the end of the room blocking the exit sits a giant venus flytrap."
  end

  def action
    World.prompt.select 'What now?' do |actions|
      actions.choice 'Cut down the venus flytrap to get through the door.',
                     -> {puts "You cut down the Venus Flytrap with your #{World.champion.weapon}! It tumbles to the floor broken!
Immediately the vines start to wither and die which causes the room to become architecturally unstable!
You take 2 damage from falling rocks."
                     World.champion.lose_health(2)}
      actions.choice 'Trigger the venus flytrap with a nearby stone.',
                     -> {puts "You throw a rock at the Venus Flytrap striking it in its open mouth.
The Venus Flytrap yells: 'Ow did you just throw a rock at me?! You dick! Just ask next time you want me to move!'
The Venus Flytrap moves out of the way of the door. Even though it's just a plant it looks very disappointed in you."}
      actions.choice 'Jump into its mouth and hope you taste bad.',
                     -> {puts "You jump into the open plant-like jaws of the Venus Flytrap and the mouth closes around you!
The plant clearly enjoys the taste of you."
                     World.prompt.select 'What do you do?' do |choices|
                       choices.choice 'Pry its jaws open!',
                                      -> {puts 'You slowly pry the jaws of the plant open. Taking 2 damage from its acidic saliva before you escape!'
                                      World.champion.lose_health(2)}
                       choices.choice 'Wet yourself.',
                                      -> {puts "The Venus Flytrap spits you out! Recoiling at the taste of your urine!
The Venus Flytrap exclaims: 'Listen man I ain't into that kind of thing. Why don't you just mosey on out of here before I have to get rude?'"}
                     end}
    end
  end

  def outro
    puts 'You try to jump through the door hitting it face first. You then remember to open the door and exit the room.'
  end

end