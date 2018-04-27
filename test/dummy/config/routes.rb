Rails.application.routes.draw do
  resources :test_resources
  mount TabularSorter::Engine => "/tabular_sorter"

  root 'test_resources#index'
end
