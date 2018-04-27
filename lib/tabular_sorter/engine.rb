module TabularSorter
  class Engine < ::Rails::Engine
    isolate_namespace TabularSorter
    initializer 'tabular_sorter.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include ControllerExtender
      end
      # ActiveSupport.on_load :active_record do
      #   ActiveRecord::Base.include(Dated)
      # end
    end
  end
end
