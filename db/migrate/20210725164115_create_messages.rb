class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :description
      t.string :hexadecimal_color
      t.integer :message_type, default: 0

      t.timestamps
    end
  end
end
