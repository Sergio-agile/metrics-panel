# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

metric = Metric.create(name: 'Sample Metric')

current_time = Time.now
start_time = current_time - 24.hours

(start_time.to_i..current_time.to_i).step(1.minute).each do |timestamp|
  metric.metric_values.create(
    value: rand(5..100), # Random value between 5 and 100
    created_at: Time.at(timestamp),
    updated_at: Time.at(timestamp)
  )
end

puts "Seeded data for metric '#{metric.name}' with values for the last 24 hours."
