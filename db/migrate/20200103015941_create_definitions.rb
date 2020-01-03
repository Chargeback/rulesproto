class CreateDefinitions < ActiveRecord::Migration[5.2]
  def change
    create_table :definitions do |t|
      t.json :value
      t.string :collector_class
      t.timestamps
    end
  end
end
