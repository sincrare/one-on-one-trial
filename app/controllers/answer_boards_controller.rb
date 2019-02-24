class AnswerBoardsController < ApplicationController
  before_action :set_answer_board, only: [:edit, :update]

  def edit
  end

  def update
    if @answer_board.update(answer_board_params)
      redirect_to @answer_board, notice: 'Answer board was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_answer_board
      @answer_board = AnswerBoard.find(params[:id])
    end

    def answer_board_params
      params.require(:answer_board).permit(:email, :name, :token)
    end
end
