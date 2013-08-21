class AddQuestionsTable < ActiveRecord::Migration
   def change
      create_table :questions do |t|
      t.string :question
      t.integer :exam_id
      t.timestamps
    end
  end
end
