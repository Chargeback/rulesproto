class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.json :config
      t.string :action_class
      t.timestamps
    end
  end
end
