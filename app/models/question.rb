class Question < ApplicationRecord
  belongs_to :question_board

  validates :content, presence: true
end
