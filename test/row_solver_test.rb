require 'minitest/autorun'
require_relative '../lib/row_solver'

class RowSolverTest < Minitest::Test 

  def setup
    @row_solver = RowSolver.new
  end

  def test_it_exists
    assert @row_solver
  end

  def test_there_is_a_puzzle_to_solve
    puzzle = File.read('../lib/row_puzzle_with_one_missing_spot.txt')
    assert_equal "123 56789", puzzle
  end

  def test_puzzle_is_a_string
    puzzle = File.read('../lib/row_puzzle_with_one_missing_spot.txt')
    assert puzzle.is_a?(String)
  end

  def test_converts_puzzle_string_to_array
    puzzle = "123 56789"
    assert_equal ["1", "2", "3", " ", "5", "6", "7", "8", "9"], @row_solver.puzzle_separated_into_array(puzzle)
  end

  def test_puzzle_array_items_converted_to_integers
    puzzle = ["1", "2", "3", " ", "5", "6", "7", "8", "9"]
    assert_equal [1, 2, 3, 0, 5, 6, 7, 8, 9], @row_solver.puzzle_array_items_to_integers(puzzle)
  end

  def test_possibilities_array_exists
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @row_solver.possibilities_array
  end

  def test_solves_for_spot_answer
    puzzle_array = [1, 2, 3, 0, 5, 6, 7, 8, 9]
    assert_equal [4], @row_solver.spot_answer(puzzle_array)
  end

  def test_it_solves_for_spot_in_row
    puzzle_array = [1, 2, 3, 0, 5, 6, 7, 8, 9]
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], 
    @row_solver.solve_for_spot_in_row(puzzle_array)
  end

  def test_it_solves_a_row_puzzle
    puzzle = "12 456789"
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], @row_solver.solve_row(puzzle)
  end

  def test_it_solves_a_mixed_row_puzzle
    puzzle = "2745638 9"
    assert_equal [2, 7, 4, 5, 6, 3, 8, 1, 9], @row_solver.solve_row(puzzle)


  end

  # def test_it_solves_multiple_rows_at_once
  #   board = File.read('../lib/second_puzzle.txt')
  #   @row_solver.split("\n")

  #   assert_equal 
  # end

end


# def test_it_convert_input_to_rows
#       puzzle = File.read('../lib/first_puzzle4.txt')
#       @rows = RowBuilder.new(puzzle)
#       assert_equal [8,26594317], @rows.first
