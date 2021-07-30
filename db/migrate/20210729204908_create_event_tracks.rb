class CreateEventTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :event_tracks do |t|
      t.string :event_type
      t.json :properties, null: false, default: {} # Sqlite not supports jsonb

      t.timestamps
    end
  end
end
