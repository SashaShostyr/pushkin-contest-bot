class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer
      t.integer :task_id
      t.integer :level

      t.timestamps
    end
  end
end
