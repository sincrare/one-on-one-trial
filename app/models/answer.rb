class Answer < ApplicationRecord
  belongs_to :answer_board
  belongs_to :question

  # updateの時だけ作用するvalidatesとする
  validates :content, presence: true, on: :update
end
