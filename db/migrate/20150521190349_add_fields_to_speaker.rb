class AddFieldsToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :team, :string
    add_column :speakers, :current, :boolean
    add_column :speakers, :external, :boolean
  end
end
