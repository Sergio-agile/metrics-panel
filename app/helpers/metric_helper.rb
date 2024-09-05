module MetricHelper

  def format_timestamp(timestamp)
    timestamp.strftime("%I:%M %p") if timestamp.present?
  end
end
