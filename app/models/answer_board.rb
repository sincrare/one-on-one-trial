class AnswerBoard < ApplicationRecord
  belongs_to :question_board
  has_many :answers
  accepts_nested_attributes_for :answers
  before_create :build_answers

  validates :email, presence: true

  has_secure_token
  private

  def build_answers
    question_board.questions.each do |question|
      answers.build(question: question)
    end
  end
end
