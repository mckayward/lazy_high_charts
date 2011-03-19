require 'lazy_high_charts/high_chart'
require 'lazy_high_charts/layout_helper.rb'

require File.join(File.dirname(__FILE__), *%w[lazy_high_charts railtie]) if defined?(::Rails::Railtie)

module LazyHighCharts

  module Rails
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        config.action_view.javascript_expansions[:high_charts] = %w(highcharts)
      end

      initializer 'lazy_high_charts.initialize' do
        ActiveSupport.on_load(:action_view) do
          include LazyHighCharts::LayoutHelper
        end
      end
    end
  end

end
