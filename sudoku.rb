class Sudoku
  attr_reader :puzzle
  def initialize(map)
    @puzzle = map
  end

  ##
  # Place +num+ at +x+, +y+ in the sodoku puzzle
  def place!(x, y, num)
    puzzle[x][y] = num
  end

  ##
  # Checks if the number at +x+, +y+ is legal
  def check_pos(x,y)

  end

  def self.check_row arr
    return false unless arr.size == 9
    arr.each {|num| return false unless arr.count(num) == 1}
  end

  def check_row(x,y)
    #row = puzzle[y]
    #row.each do |num, index|
      #p num
      #p index
      #false if num == row[x] and index != x
    #end
    #true
  end

  def check_col(x,y)
  end

  ##
  # Checks the whole puzzle to see if it's a solution
  def check_puzzle
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

test = []

test_map = Sudoku.new(test)
fail if test_map.valid?

9.times do |i|
  test << []
  9.times do |j|
    test[i] << (i + j ) % 9 + 1
  end
end

test_map = Sudoku.new(test)
fail unless test_map.valid?
#test_map.place! 0,0,3
#p test_map.puzzle
#p test_map.check_row(0,0)
puts "\e[32m Great job!\e[0m"
