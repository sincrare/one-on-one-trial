class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :question_board, index: true, foreign_key: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
