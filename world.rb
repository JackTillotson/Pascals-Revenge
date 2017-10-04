require 'tty/prompt'
require_relative 'Scenarios/fight_scenario'
require_relative 'Scenarios/Puzzle Scenarios/puzzle_scenario'
require_relative 'Scenarios/trap_scenario'

module World
  def self.prompt
    @prompt ||= TTY::Prompt.new
  end

  def self.dice
    @dice ||= Dice.new
  end

  def self.champion(object = nil)
    @champion ||= object
  end

end


class Dice
  def roll_d20
    rand(1..20)
  end
  def roll_d12
    rand(1..12)
  end
  def roll_d10
    rand(1..10)
  end
  def roll_d8
    rand(1..8)
  end
  def roll_d6
    rand(1..6)
  end
  def roll_d4
    rand(1..4)
  end
  def roll_d3
    rand(1..3)
  end

  def roll_d(num)
    rand(1..num)
  end
end

def gear_to_s(gear)
  gear = gear.to_s
  gear.tr('_', ' ')
end

def next_scenario
  scenarios = [:fight_scenario, :fight_scenario, :trap_scenario, :trap_scenario, :puzzle_scenario]
  send(scenarios[rand(0..4)])
  World.prompt.select("\nWhat will you do next?") do |choices|
    choices.choice 'Move on.'
    choices.choice "Drink a potion. Current Health: #{World.champion.health}. Potions Remaining: #{World.champion.potions}", -> {World.champion.use_potion}
  end
end