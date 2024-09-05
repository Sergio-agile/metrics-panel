class Metric < ApplicationRecord
  has_many :metric_values

  validates :name, presence: true

  def average_per_minute
    calculate_average(:minute)
  end

  def average_per_hour
    calculate_average(:hour)
  end

  def average_per_day
    calculate_average(:day)
  end

  private

  def calculate_average(period)
    # values = metric_values.group_by_period(period, :created_at).average(:value)
    # values.values.sum / values.keys.size if values.present?
    values = metric_values.group_by_period(period, :created_at).average(:value)
    valid_values = values.values.compact
    valid_values.sum / valid_values.size if valid_values.present?
  end

end
