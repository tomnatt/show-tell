class JoinSpeakersTalks < ActiveRecord::Migration
  def up
    create_table :speakers_talks, id: false do |t|
      t.belongs_to :speaker, index: true
      t.belongs_to :talk, index: true
    end
  end

  def down
    drop_table :speakers_talks
  end
end
