class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :details
      t.datetime :start
      t.datetime :endtime
      t.string :status
      t.integer :priority
      t.timestamps
    end
  end
end
