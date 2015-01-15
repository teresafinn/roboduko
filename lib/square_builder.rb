class SquareBuilder

  def build_squares(array_of_rows)
    array_of_rows = array_of_rows.map(&:dup)
    @array_of_all_squares = []
    9.times do 
      array_of_rows.delete_if { |e| e.empty? }
      array_of_one_square = [] 

      (0..2).each do |row_num|
        array_of_one_square << array_of_rows[row_num].shift(3)
      end 
      @array_of_all_squares << array_of_one_square.flatten
    end
    @array_of_all_squares
  end
end