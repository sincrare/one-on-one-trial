class AnswerBoard < ApplicationRecord
  belongs_to :question_board
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true, reject_if: :all_blank
  after_create :create_answers

  validates :email, presence: true

  has_secure_token
  private

  def create_answers
    question_board.questions.each do |question|
      answers.create(question_id: question.id)
    end
    save!(validate: false)
  end
end
