class ColumnBuilder

  def build_column(array_of_rows)
    array_of_columns = []
    (0..8).each do |num|
      array_of_columns << array_of_rows.map { |e| e[num] }
    end
    array_of_columns
  end


end


array = [1,2,3,5,6,7,8,9]