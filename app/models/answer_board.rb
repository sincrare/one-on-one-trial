class AnswerBoard < ApplicationRecord
  belongs_to :question_board
  has_many :answers
  # 解答欄は削除されないので、allow_destroyは不要
  accepts_nested_attributes_for :answers, reject_if: :all_blank

  # save!を自分で呼ばなくてよくなるのでbefore_createでanswersをつくっておく
  before_create :create_answers

  validates :email, presence: true

  has_secure_token
  private

  def build_answers
    question_board.questions.each do |question|
      answers.build(question: question)
    end
  end
end
