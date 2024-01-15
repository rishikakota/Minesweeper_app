# app/services/minesweeper_generator.rb
class MinesweeperGenerator
    def initialize(width, height, mines)
      @width = width
      @height = height
      @mines = mines
      puts "generate_board: @height: #{@height}, @width: #{@width}"
    end
  
    def generate_board
      board = Array.new(@height) { Array.new(@width, 'empty') }
      place_mines(board)
      calculate_numbers(board)
      board
    end
  
    private
  
    def place_mines(board)
      @mines.times do
        x, y = random_position
        board[y][x] = 'mine'
      end
    end
  
    def calculate_numbers(board)
      (0...@height).each do |y|
        (0...@width).each do |x|
          next if board[y][x] == 'mine'
          board[y][x] = count_mines_around(board, x, y)
        end
      end
    end
  
    def count_mines_around(board, x, y)
      count = 0
      (-1..1).each do |dy|
        (-1..1).each do |dx|
          nx, ny = x + dx, y + dy
          next if nx < 0 || ny < 0 || nx >= @width || ny >= @height
          count += 1 if board[ny][nx] == 'mine'
        end
      end
      count
    end
  
    def random_position
      [rand(@width), rand(@height)]
    end
  end
  