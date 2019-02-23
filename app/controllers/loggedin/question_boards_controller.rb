class Loggedin::QuestionBoardsController < Loggedin::ApplicationController
  before_action :set_question_board, only: [:show, :edit, :update, :destroy]

  # GET /question_boards
  def index
    @question_boards = QuestionBoard.all
  end

  # GET /question_boards/1
  def show
  end

  # GET /question_boards/new
  def new
    @question_board = QuestionBoard.new
  end

  # GET /question_boards/1/edit
  def edit
  end

  # POST /question_boards
  def create
    @question_board = QuestionBoard.new(question_board_params)

    if @question_board.save
      redirect_to @question_board, notice: 'Question board was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /question_boards/1
  def update
    if @question_board.update(question_board_params)
      redirect_to @question_board, notice: 'Question board was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /question_boards/1
  def destroy
    @question_board.destroy
    redirect_to question_boards_url, notice: 'Question board was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_board
      @question_board = QuestionBoard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_board_params
      params.require(:question_board).permit(:title)
    end
end
