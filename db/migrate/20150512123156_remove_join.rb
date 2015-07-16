class RemoveJoin < ActiveRecord::Migration
  def up
    drop_table :speakers_talks
  end

  def down
    create_table :speakers_talks, :id => false do |t|
      t.integer :speaker_id
      t.integer :talk_id
    end

    add_index :speakers_talks, [:speaker_id, :talk_id]
  end
end
