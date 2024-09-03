class Metric < ApplicationRecord
  has_many :metric_values
  validates :name, presence: true
  validates :data_type, presence: true, inclusion: { in: %w(number decimal) }

  enum data_type: { number: 0, decimal: 1 }
end
