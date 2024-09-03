class CreateMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :data_type

      t.timestamps
    end
  end
end
