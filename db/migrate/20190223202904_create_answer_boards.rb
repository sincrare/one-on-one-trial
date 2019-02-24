class CreateAnswerBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_boards do |t|
      t.references :question_board, foreign_key: true
      t.string :email, null: false
      t.string :name
      t.string :token, null: false, index: true

      t.timestamps
    end
  end
end
