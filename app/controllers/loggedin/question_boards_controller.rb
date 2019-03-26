class Loggedin::QuestionBoardsController < Loggedin::ApplicationController
  # %i(show ...)にしたら記述が簡潔
  before_action :set_question_board, only: [:show, :edit, :update, :destroy]

  def index
    # orderをいれたい
    @question_boards = current_user.question_boards.all
  end

  def show
  end

  def new
    @question_board = current_user.question_boards.new
  end

  def edit
  end

  def create
    @question_board = current_user.question_boards.build(question_board_params)

    if @question_board.save
      redirect_to loggedin_question_board_path(@question_board), notice: 'Question board was successfully created.'
    else
      render :new
    end
  end

  def update
    if @question_board.update(question_board_params)
      redirect_to loggedin_question_board_path(@question_board), notice: 'Question board was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # destroy! つけておくと気づける？
    @question_board.destroy
    redirect_to loggedin_question_boards_url, notice: 'Question board was successfully destroyed.'
  end

  private
    def set_question_board
      @question_board = current_user.question_boards.find(params[:id])
    end

    def question_board_params
      params.require(:question_board).permit(:title, questions_attributes: [:id, :content, :_destroy])
    end
end
