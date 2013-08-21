class AddExamsTable < ActiveRecord::Migration
  def change
      create_table :exams do |t|
        t.string :topic
        t.integer :user_id
        t.timestamps
    end
  end
end
