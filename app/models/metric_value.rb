class MetricValue < ApplicationRecord
  belongs_to :metric

  validates :value, numericality: true, presence: true
end
