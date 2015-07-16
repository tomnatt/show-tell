class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.date :date
      t.string :slides

      t.timestamps
    end
  end
end
