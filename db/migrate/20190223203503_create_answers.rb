class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :answer_board, foreign_key: true
      t.references :question, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
