if ENV['SIMPLECOV']
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
    minimum_coverage 100
    minimum_coverage_by_file 100
  end
end

require 'age'
