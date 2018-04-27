$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'tabular_sorter/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'tabular_sorter'
  s.version     = TabularSorter::VERSION
  s.authors     = ['Pavlo Chervinskyi']
  s.email       = ['cpavlo@gmail.com']
  s.homepage    = 'https://github.com/cpavlo/tabular_sorter'
  s.summary     = 'Tabular Sorter'
  s.description = 'Tabular sorter for an index page of rails scaffold'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 4.1'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3'
end
