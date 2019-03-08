class AnswerBoardsController < ApplicationController
  before_action :set_answer_board, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @answer_board.update(answer_board_params)
      redirect_to answer_board_path(@answer_board.token), notice: 'Answer board was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_answer_board
      @answer_board = AnswerBoard.find_by(token: params[:token])
    end

    def answer_board_params
      params.require(:answer_board).permit(:name, answers_attributes: [:id, :content])
    end
end
