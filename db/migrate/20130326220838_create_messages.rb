class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :screen_name, :string
      t.column :comment, :text

      t.timestamps
    end
  end
end
