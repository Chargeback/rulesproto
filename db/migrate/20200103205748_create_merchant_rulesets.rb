class CreateMerchantRulesets < ActiveRecord::Migration[5.2]
  def change
    create_table :merchant_rulesets do |t|
      t.string :name
      t.string :merchant_id
      t.bigint :definition_id, index: true
      t.bigint :action_id, index: true
      t.timestamps
    end
  end
end
