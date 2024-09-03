class MetricsController < ApplicationController

  def index
    @metrics = Metric.all
  end

  def new
    @metric = Metric.new

    # turbo_stream.replace('add-metric', template: 'metrics/new')
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

  private

  def metric_params
    params.require(:metric).permit(:name, :data_type)
  end


end
