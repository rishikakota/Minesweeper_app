# app/models/user.rb
class User < ApplicationRecord
    has_many :minesweeper_boards
  end
  