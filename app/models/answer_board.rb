class AnswerBoard < ApplicationRecord
  belongs_to :question_board

  validates :name, presence: true
end
