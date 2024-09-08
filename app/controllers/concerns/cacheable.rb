module Cacheable
  extend ActiveSupport::Concern

  private

  def set_etag(metrics)
    Digest::MD5.hexdigest(metrics.map(&:updated_at).to_s)
  end
end
