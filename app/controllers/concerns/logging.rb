module Logging
  extend ActiveSupport::Concern

  included do
    before_action :set_logging_params
    after_action :logging
  end

  def set_logging_params
    @filter_params ||= ActionDispatch::Http::ParameterFilter.new(except_logging_params)
    filtered_params = @filter_params.filter(params)
    Log4r::MDC.put(:method, request.method)
    Log4r::MDC.put(:url, request.url)
    Log4r::MDC.put(:params, filtered_params)
  end

  def logging
    Log4r::Logger['access_log'].info('SUCCESS')
  end

  private

  def except_logging_params
    Rails.application.config.filter_parameters
  end
end
