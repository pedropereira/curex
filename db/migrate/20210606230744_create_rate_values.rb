class CreateRateValues < ActiveRecord::Migration[6.1]
  def change
    create_table :rate_values do |t|
      t.float :value, null: false
      t.timestamps

      t.references :rate, null: false
    end
  end
end
