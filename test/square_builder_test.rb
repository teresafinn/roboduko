require 'minitest/autorun'
require_relative '../lib/square_builder'
require_relative '../lib/board_parser'
require_relative '../lib/row_solver'

class SquareBuilderTest < Minitest::Test

  def setup
    @square_builder = SquareBuilder.new
  end

  def test_it_exists
    assert @square_builder
  end

  def test_it_inherits_rows_and_formats_them_correctly
    @board_parser = BoardParser.new
    @row_solver = RowSolver.new
    board = File.read('../support/board_puzzle_with_one_missing_spot_in_each_row.txt')
    rows = @board_parser.split_board_into_rows(board)
    array_of_rows = rows.map { |e| @row_solver.convert_input_string_to_integer_array(e) }
    assert_equal [0, 2, 6, 5, 9, 4, 3, 1, 7], array_of_rows[0]
  end

  def test_it_builds_a_square_based_on_rows
    @board_parser = BoardParser.new
    @row_solver = RowSolver.new
    board = File.read('../support/board_puzzle_with_one_missing_spot_in_each_row.txt')
    rows = @board_parser.split_board_into_rows(board)
    array_of_rows = rows.map { |e| @row_solver.convert_input_string_to_integer_array(e) }

    assert_equal [0, 2, 6, 7, 0, 5, 3, 9, 0], @square_builder.build_squares(array_of_rows).first

    assert_equal [3, 1, 7, 9, 4, 2, 8, 6, 5], @square_builder.build_squares(array_of_rows)[2]

    assert_equal [0, 8, 6, 5, 0, 9, 4, 2, 0], @square_builder.build_squares(array_of_rows).last

  end
end