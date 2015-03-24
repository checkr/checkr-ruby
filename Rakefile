require 'rake/testtask'
require './tasks/api_test.rb'

task :default => [:test]

Rake::TestTask.new do |t|
  t.pattern = './test/**/*_test.rb'
end

task :test_api, [:api_key] do |t, args|
  api_key = args[:api_key]
  api_test = APITest.new(api_key)
  api_test.run
end
