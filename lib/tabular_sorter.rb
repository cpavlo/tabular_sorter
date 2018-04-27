require 'tabular_sorter/engine'

module TabularSorter
  module ControllerExtender
    def tabular_sorter
      @tabular_sorter ||= TabularSorter.new(params)
    end
  end

  class TabularSorter

    def initialize(params)
      @sorter = params[:ts] ? params[:ts] : {}
    end

    def apply(scope)
      return scope unless active?
      return scope if @sorter[:by].nil?
      scope.order @sorter[:by].split(':').map { |c| "#{c} #{@sorter[:order]}" }.join(', ')
    end

    def active?
      @sorter.present?
    end

    def empty?
      @sorter.empty?
    end

  end
end
