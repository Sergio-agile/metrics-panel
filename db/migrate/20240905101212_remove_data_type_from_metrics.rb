class RemoveDataTypeFromMetrics < ActiveRecord::Migration[7.1]
  def change
    remove_column :metrics, :data_type, :string
  end
end
