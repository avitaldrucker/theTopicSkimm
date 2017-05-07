class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.integer :state_id
      t.references :capitable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :cities, :state_id
  end
end
