require 'pry'
require 'minitest/autorun'
require_relative '../lib/column_builder'
require_relative '../lib/board_parser'
require_relative '../lib/row_solver'

class ColumnBuilderTest < Minitest::Test 

  def setup
    @column_builder = ColumnBuilder.new
  end

  def test_it_exists
    assert @column_builder
  end

  #you need to build a column from the rows that you have. so you'll first need to import the board. then you need to ... so you need to import your board parser. your board parser will parse your board into rows. then you can take each of those rows and call on one position number in each row

  def test_it_converts_string_rows_to_integer_array_rows
    @board_parser = BoardParser.new
    @row_solver = RowSolver.new
    board = File.read('../support/board_puzzle_with_one_missing_spot_in_each_row.txt')
    rows = @board_parser.split_board_into_rows(board)
    array_of_rows = rows.map { |e| @row_solver.convert_input_string_to_integer_array(e) }
    assert_equal [0, 2, 6, 5, 9, 4, 3, 1, 7], array_of_rows[0]
  end

  def test_it_builds_columns_by_calling_on_row_positions
    #you need to go through each array in the list of arrays and draw on a position number. 
    #
    @board_parser = BoardParser.new
    @row_solver = RowSolver.new
    board = File.read('../support/board_puzzle_with_one_missing_spot_in_each_row.txt')
    rows = @board_parser.split_board_into_rows(board)
    array_of_rows = rows.map { |e| @row_solver.convert_input_string_to_integer_array(e) }

     #array_of_rows = [ [026594317], [705638942], [390721865], [16359278], [948207153], [257810694], [531902086], [482176509], [67938542] ]

     #array_of_rows[0] = [026594317]
     #array_of_rows[0[0]] = [0]
     #array_of_rows[0[1]] = [2]

    #array_of_rows[0[0]] = [0]
    #array_of_rows[1[0]] = [7]
    #array_of_rows[2[0]] = [3]
    #array_of_rows[3[0]] = [1]

    #column_1 = array_of_rows.map { |e| e[0] } => [0,7,3,1,9,2,5,4,6]
    #column_2 = array_of_rows.map { |e| e[1] } => [2,0,9,6,4,5,3,8,7]
    #column_3 = array_of_rows.map { |e| e[2] }
    #column_4 = array_of_rows.map { |e| e[3] }
    #column_5 = array_of_rows.map { |e| e[4] }
    #column_6 = array_of_rows.map { |e| e[5] }
    #column_7 = array_of_rows.map { |e| e[6] }
    #column_8 = array_of_rows.map { |e| e[7] }
    #column_9 = array_of_rows.map { |e| e[8] } 


    assert_equal [0, 7, 3, 1, 9, 2, 5, 4, 6], @column_builder.build_column(array_of_rows).first
    assert_equal [2, 0, 9, 6, 4, 5, 3, 8, 7], @column_builder.build_column(array_of_rows)[1]
  end






end