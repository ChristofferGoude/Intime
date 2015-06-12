class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.integer :timer
      t.boolean :finished

      t.timestamps
    end
  end
end
