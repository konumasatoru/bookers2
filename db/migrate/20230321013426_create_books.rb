class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
     t.text :Opinion
     t.string :Title
     t.integer :user_id

      t.timestamps
    end
  end
end
