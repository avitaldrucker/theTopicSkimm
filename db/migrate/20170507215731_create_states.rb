class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.integer :nation_id, null: false

      t.timestamps
    end

    add_index :states, :nation_id
    add_index :states, [:name, :nation_id], unique: true
  end
end
