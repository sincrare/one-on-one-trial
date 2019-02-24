class AnswerBoard < ApplicationRecord
  belongs_to :question_board

  validates :email, presence: true

  has_secure_token
end
