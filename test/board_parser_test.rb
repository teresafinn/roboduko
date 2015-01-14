require 'minitest/autorun'
require_relative '../lib/board_parser'
require_relative '../lib/row_solver'

class BoardParserTest < Minitest::Test 

  def setup
    @board_parser = BoardParser.new
  end

  def test_it_exists
    assert @board_parser
  end

  def test_there_is_a_board_with_data_to_parse
    board = File.read('../lib/board_puzzle_with_one_missing_spot_in_each_row.txt')
    #split board into chunks
    assert_equal " 26594317\n", board[0..9]
  end

  def test_it_splits_board_into_rows
    board = File.read('../lib/board_puzzle_with_one_missing_spot_in_each_row.txt')
    assert_equal 9, @board_parser.split_board_into_rows(board).count
  end

  def test_solving_a_parsed_board
    @row_solver = RowSolver.new
    board = File.read('../lib/board_puzzle_with_one_missing_spot_in_each_row.txt')
    rows = @board_parser.split_board_into_rows(board)
    solved_rows = rows.map { |e| @row_solver.solve_row(e) }
    refute_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], solved_rows[0]
    assert_equal [8, 2, 6, 5, 9, 4, 3, 1, 7], solved_rows[0]

    #[ " 26594317", "7 5638942", "39 721865", "163 59278", "9482 7153", "25781 694", "531902 86", "4821765 9", 67938542 ]
  end



end