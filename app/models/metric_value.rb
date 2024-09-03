class MetricValue < ApplicationRecord
  belongs_to :metric

  validates :value, numericality: true, presence: true

  def validate_value
    if metric.data_type == "number"
      errors.add(:value, "must be an integer") unless value.is_a?(Integer)
    elsif metric.data_type == "decimal"
      errors.add(:value, "must be a decimal") unless value.is_a?(Decimal)
    end
  end
end
