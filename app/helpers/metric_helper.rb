module MetricHelper

  def format_timestamp(timestamp)
    timestamp.strftime("%Y-%m-%d") if timestamp.present?
  end
end
