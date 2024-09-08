require 'rails_helper'

RSpec.describe MetricValue, type: :model do
  let(:metric) { Metric.create(name: 'Test Metric') }

  context 'validations' do
    it 'is valid with a valid value' do
      metric_value = MetricValue.new(value: 10, metric: metric)
      expect(metric_value).to be_valid
    end

    it 'is invalid without a value' do
      metric_value = MetricValue.new(metric: metric)
      expect(metric_value).not_to be_valid
      expect(metric_value.errors[:value]).to include("can't be blank")
    end

    it 'is invalid with a non-integer value' do
      metric_value = MetricValue.new(value: 10.5, metric: metric)
      expect(metric_value).not_to be_valid
      expect(metric_value.errors[:value]).to include('must be an integer')
    end

    it 'is invalid without a metric' do
      metric_value = MetricValue.new(value: 10)
      expect(metric_value).not_to be_valid
      expect(metric_value.errors[:metric]).to include("must exist")
    end

  end
end
