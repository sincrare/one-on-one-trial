class InvitationMailer < ApplicationMailer
  def create_invitation(user, answer_board)
    @answer_board = answer_board
    mail to: answer_board.email, subject: "[1 ON 1] #{user.name}さんより質問事項が届いています"
  end
end
