require_relative 'matrix'

class Matrix

  def saddle_points
    find_row_max.select{|row| rows[row[0]][row[1]]==find_column_min(row[1])}
  end

  def find_row_max
    rows.map.with_index {|row, i| [i, row.index(row.max)]}
  end

  def find_column_min(column)
    columns[column].min
  end

end
