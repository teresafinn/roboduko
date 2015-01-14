class RowSolver

  attr_reader :possibilities_array

  def initialize
    @possibilities_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def puzzle_separated_into_array(puzzle)
    puzzle.chars
  end

  def puzzle_array_items_to_integers(puzzle)
    puzzle.map { |e| e.to_i }
  end

  def convert_input_string_to_integer_array(input)
    puzzle_array_items_to_integers(puzzle_separated_into_array(input))
  end

  def spot_answer(puzzle_array)
    possibilities_array - puzzle_array
  end

  def solve_for_spot_in_row(puzzle_array)
    spot_answer = spot_answer(puzzle_array)
    if puzzle_array.index(0)
      puzzle_array[puzzle_array.index(0)] = spot_answer
    end
    solved_puzzle = puzzle_array.flatten
  end

  def solve_row(puzzle)
    step1 = convert_input_string_to_integer_array(puzzle)
    solve_for_spot_in_row(step1)
  end

end

