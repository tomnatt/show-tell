class RemoveTalksFromSpeakers < ActiveRecord::Migration
  def up
    remove_column :speakers, :talks
  end

  def down
    add_column :speakers, :talks, :integer
  end
end
