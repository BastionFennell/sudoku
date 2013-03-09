class Sudoku
  attr_reader :puzzle
  def initialize(map)
    @puzzle = map
  end

  ##
  # Place +num+ at +col+, +row+ in the sodoku puzzle
  def place!(col, row, num)
    @puzzle[row][col] = num
  end

  ##
  # Checks if the number at +col+, +row+ is legal
  def check_pos(col,row,num)
    mat_num = row / 3 + col / 3
    check_row row, num and check_col col, num and check_mat mat_num, num
  end

  def self.check_row arr
    return false unless arr.size == 9
    arr.each {|num| return false unless arr.count(num) == 1 and (1..9) === num}
  end

  def check_row(row,num)
    @puzzle[row].count(num) == 0
  end

  def self.check_col arr, col
    return false unless arr.size == 9
    col_arr = []
    9.times do |index|
      col_arr << arr[index][col]
    end
    check_row col_arr
  end

  def check_col(col,num)
    col_arr = []
    9.times do |index|
      col_arr << @puzzle[index][col]
    end
    col_arr.count(num) == 0
  end

  def self.check_mat mat
    mat_arr = []
    mat.each do |row|
      row.each do |num|
        mat_arr << num
      end
    end
    check_row mat_arr
  end

  def check_mat mat, num
    mat_arr = []
    9.times do |index|
      row = 3 * (mat / 3) + index / 3
      col = 3 * (mat % 3) + index % 3
      mat_arr << @puzzle[row][col] 
    end
    mat_arr.count(num) == 0
  end 

  ##
  # Checks the whole puzzle to see if it's a solution
  def check_puzzle
    9.times do |index|
      return false unless Sudoku.check_row @puzzle[index] 
     
      mat_arr = []
      9.times do |mat_ind|
        row = 3 * (index / 3) + mat_ind / 3
        col = 3 * (index % 3) + mat_ind % 3
        mat_arr << @puzzle[row][col] 
      end
      
      return false unless Sudoku.check_row mat_arr
      return false unless Sudoku.check_col @puzzle, index
    end
    p @puzzle
    true
  end

  def valid?
    puzzle.size > 0 
  end

  ##
  # Returns the puzzle solution
  def solve
  end

  ##
  # Turns the current puzzle into the solution
  def solve!
  end
end

fail unless Sudoku.check_row [1,2,3,4,5,6,7,8,9]
fail if Sudoku.check_row [2,3,4,5,6,7,8,9]
fail if Sudoku.check_row [2,2,3,4,5,6,7,8,9]
fail if Sudoku.check_row [2,2,2,4,5,6,7,8,9]
fail if Sudoku.check_row [2,3,4,5,6,7,8,9,10]

test = []

test_map = Sudoku.new(test)
fail if test_map.valid?

test =
[[4,1,7,5,2,3,6,9,8],
 [2,5,3,9,8,6,1,4,7],
 [9,8,6,1,7,4,3,2,5],
 [6,9,1,8,5,7,4,3,2],
 [5,3,2,4,6,9,8,7,1],
 [7,4,8,2,3,1,5,6,9],
 [3,7,9,6,1,5,2,8,4],
 [8,6,5,7,4,2,9,1,3],
 [1,2,4,3,9,8,7,5,6]]

test_map = Sudoku.new(test)
test_map.place!(0,0,0)
fail unless test_map.puzzle[0][0] == 0
fail unless test_map.check_row(0,4)
fail unless test_map.valid?
test_map.place! 0,0,4

fail unless Sudoku.check_col test_map.puzzle, 1
test_map.place! 0,0,2
fail if Sudoku.check_col test_map.puzzle, 0

test_map.place! 0,0,0
fail unless test_map.check_col 0,4
test_map.place! 0,0,4
fail if test_map.check_col 0,4

fail if Sudoku.check_mat [[1,1,3],[4,5,6],[7,8,9]]
fail unless Sudoku.check_mat [[1,2,3],[4,5,6],[7,8,9]]

fail if test_map.check_mat 0,1

test_map.place! 0,0,0

fail unless test_map.check_pos 0,0,4

fail if test_map.check_puzzle


puts "\e[32m Great job!\e[0m"
