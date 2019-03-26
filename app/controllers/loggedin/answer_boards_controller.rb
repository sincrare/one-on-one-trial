class Loggedin::AnswerBoardsController < Loggedin::ApplicationController
  before_action :set_question_board, only: %i(new create)

  def new
    @answer_board = @question_board.answer_boards.new
  end

  def create
    @answer_board = @question_board.answer_boards.build(answer_board_params)

    if @answer_board.save
      InvitationMailer.create_invitation(current_user, @answer_board).deliver_now
      redirect_to loggedin_question_boards_path, notice: 'Answer board was successfully created.'
    else
      render :new
    end
  end

  private

  def set_question_board
    @question_board = current_user.question_boards.find(params[:question_board_id])
  end

  def answer_board_params
    params.require(:answer_board).permit(:email)
  end
end