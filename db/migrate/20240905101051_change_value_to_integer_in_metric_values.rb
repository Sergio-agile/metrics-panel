class ChangeValueToIntegerInMetricValues < ActiveRecord::Migration[7.1]
  def change
    remove_column :metric_values, :value, :decimal

    add_column :metric_values, :value, :integer
  end
end
