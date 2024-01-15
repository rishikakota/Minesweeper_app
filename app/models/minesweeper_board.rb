# app/models/minesweeper_board.rb
class MinesweeperBoard < ApplicationRecord
  belongs_to :user, optional: true
  before_create :generate_board

  def generate_board
    generator = MinesweeperGenerator.new(width, height, mines)
    self.data = generator.generate_board.to_json
  end

  def formatted_created_at
    created_at.strftime("%B %d, %Y %H:%M %p")
  end
end
