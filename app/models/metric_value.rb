class MetricValue < ApplicationRecord
  belongs_to :metric

  validates :value, numericality: { only_integer: true }, presence: true
end
