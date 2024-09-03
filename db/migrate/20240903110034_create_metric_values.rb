class CreateMetricValues < ActiveRecord::Migration[7.1]
  def change
    create_table :metric_values do |t|
      t.decimal :value
      t.references :metric, null: false, foreign_key: true

      t.timestamps
    end
  end
end
