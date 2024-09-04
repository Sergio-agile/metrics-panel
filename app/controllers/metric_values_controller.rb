class MetricValuesController < ApplicationController

  def new
    @metric = Metric.find(params[:metric_id])
    @metric_value = MetricValue.new(metric: @metric)

    respond_to(&:turbo_stream)
  end

  def cancel
    @metric = Metric.find(params[:metric_id])

    respond_to(&:turbo_stream)
  end

  def create
    @metric = Metric.find(params[:metric_value][:metric_id])
    @metric_value = MetricValue.new(metric_value_params)
    @metric_value.metric = @metric

    if @metric_value.save
      redirect_to metrics_path # turbo_stream to append metric to the list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def metric_value_params
    params.require(:metric_value).permit(:value)
  end


end
