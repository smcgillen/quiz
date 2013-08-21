class AddAnswersTable < ActiveRecord::Migration
     def change
      create_table :answers do |t|
      t.string :description
      t.boolean :correct, :default => false
      t.integer :question_id
      t.integer :exam_id
      t.timestamps
    end
  end
end
