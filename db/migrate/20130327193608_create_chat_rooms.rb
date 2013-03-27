class CreateChatRooms < ActiveRecord::Migration
  def change
    create_table :chat_rooms do |t|
      t.column :started_by, :string
      t.column :topic, :string

      t.timestamps
    end
    add_column :messages, :chat_room_id, :integer
  end
end