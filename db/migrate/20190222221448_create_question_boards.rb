class CreateQuestionBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :question_boards do |t|
      t.string :title

      t.timestamps
    end
  end
end
