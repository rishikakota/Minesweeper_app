# app/controllers/minesweeper_boards_controller.rb
class MinesweeperBoardsController < ApplicationController

  def home
    @recent_boards = MinesweeperBoard.order(created_at: :desc)
  end  

  def all_boards
    @boards = MinesweeperBoard.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def new
    @minesweeper_board = MinesweeperBoard.new
    @height = params[:height].present? ? params[:height].to_i : 10
    @width = params[:width].present? ? params[:width].to_i : 10
    puts "generate_board in controller: @height: #{@height}, @width: #{@width}"
    @recent_boards = MinesweeperBoard.order(created_at: :desc).limit(10)
  end

  def create
    @minesweeper_board = MinesweeperBoard.new(minesweeper_board_params)
    generator = MinesweeperGenerator.new(params[:width].to_i, params[:height].to_i, params[:mines].to_i)
    @minesweeper_board.data = generator.generate_board.to_json

    if @minesweeper_board.save
      redirect_to @minesweeper_board
    else
      render 'new'
    end
  end

  def show
    @minesweeper_board = MinesweeperBoard.find(params[:id])
    @board_data = JSON.parse(@minesweeper_board.data)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @minesweeper_board }
    end
  end  

  private

  def minesweeper_board_params
    params.require(:minesweeper_board).permit(:email, :width, :height, :mines, :name, :data)
  end
end
