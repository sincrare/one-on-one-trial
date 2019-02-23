class QuestionBoard < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :answer_boards

  accepts_nested_attributes_for :questions, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
end
