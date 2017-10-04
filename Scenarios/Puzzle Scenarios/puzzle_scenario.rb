require_relative 'mad_scientist'

def puzzle_scenario
  puzzles = [:mad_scientist, :venus_flytrap]
  num = rand(0..1)
  send(puzzles[num])
end

def mad_scientist
  puzzle = MadScientist.new
  puzzle.intro
  puzzle.action
  puzzle.outro
end