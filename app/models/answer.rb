class Answer < ApplicationRecord
  belongs_to :answer_board
  belongs_to :question
end
