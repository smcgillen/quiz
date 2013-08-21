class AddAttemptsTable < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
          t.integer :user_id
          t.integer :answer_id
          t.timestamps
    end
  end
end
