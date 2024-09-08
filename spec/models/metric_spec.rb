require 'rails_helper'

RSpec.describe Metric, type: :model do
  describe 'validations' do

  end

  describe 'average calculations' do
    it 'is valid with a valid name' do
      metric = Metric.new(name: 'Test Metric')
      expect(metric).to be_valid
    end

    it 'is invalid without a name' do
      metric = Metric.new(name: nil)
      expect(metric).to_not be_valid
    end

    describe 'average calculations' do
      let(:metric) { Metric.create(name: 'Test Metric') }

      it 'calculates the correct average per minute' do
        (0..4).each do |i|
          metric.metric_values.create(value: 10, created_at: i.minutes.ago)
        end

        average = metric.average_per_minute.round(1)
        expect(average).to eq(10.0)
      end

      it 'calculates the correct average per hour' do
        (0..4).each do |i|
          metric.metric_values.create(value: 20, created_at: i.hours.ago)
        end

        average = metric.average_per_hour.round(1)
        expect(average).to eq(20.0)
      end

      it 'calculates the correct average per day' do
        (0..4).each do |i|
          metric.metric_values.create(value: 30, created_at: i.days.ago)
        end

        average = metric.average_per_day.round(1)
        expect(average).to eq(30.0)
      end
    end
  end
end
