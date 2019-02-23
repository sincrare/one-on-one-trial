class AnswerBoardsController < ApplicationController
  before_action :set_answer_board, only: [:show, :edit, :update, :destroy]

  # GET /answer_boards
  def index
    @answer_boards = AnswerBoard.all
  end

  # GET /answer_boards/1
  def show
  end

  # GET /answer_boards/new
  def new
    @answer_board = AnswerBoard.new
  end

  # GET /answer_boards/1/edit
  def edit
  end

  # POST /answer_boards
  def create
    @answer_board = AnswerBoard.new(answer_board_params)

    if @answer_board.save
      redirect_to @answer_board, notice: 'Answer board was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /answer_boards/1
  def update
    if @answer_board.update(answer_board_params)
      redirect_to @answer_board, notice: 'Answer board was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /answer_boards/1
  def destroy
    @answer_board.destroy
    redirect_to answer_boards_url, notice: 'Answer board was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_board
      @answer_board = AnswerBoard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_board_params
      params.require(:answer_board).permit(:email, :name, :token)
    end
end
