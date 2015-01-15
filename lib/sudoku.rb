# require_relative 'solver'

filename = ARGV[0]
puzzle = File.read('first_puzzle.txt')
solver = Solver.new
solution = solver.solve(puzzle)
puts solution
