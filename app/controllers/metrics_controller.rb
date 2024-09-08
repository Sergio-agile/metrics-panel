class MetricsController < ApplicationController
  include Cacheable

  def index
    @metrics = Metric.all.order(created_at: :desc).includes(:metric_values)

    etag = set_etag(@metrics)
    fresh_when etag: etag
  end

  def new
    @metric = Metric.new

    respond_to(&:turbo_stream)
  end

  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      redirect_to metrics_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def cancel
    respond_to(&:turbo_stream)
  end

  private

  def metric_params
    params.require(:metric).permit(:name)
  end

end
