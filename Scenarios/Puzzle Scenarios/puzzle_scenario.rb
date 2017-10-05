require_relative 'mad_scientist'
require_relative 'venus_flytrap'

def puzzle_scenario
  puzzles = [MadScientist.new, VenusFlytrap.new]
  num = rand(0..1)
  puzzle = puzzles[num]
  puzzle.intro
  puzzle.action
  puzzle.outro
end