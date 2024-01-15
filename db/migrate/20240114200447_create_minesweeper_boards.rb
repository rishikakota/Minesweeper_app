class CreateMinesweeperBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :minesweeper_boards do |t|
      t.string :email
      t.integer :width
      t.integer :height
      t.integer :mines
      t.string :name
      t.text :data

      t.timestamps
    end
  end
end
