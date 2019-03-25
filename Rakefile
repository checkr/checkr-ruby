require 'bump/tasks'
require 'rake/testtask'
require './tasks/api_test.rb'

task :default => [:test]

Rake::TestTask.new do |t|
  t.pattern = './test/**/*_test.rb'
end

task :test_api, [:api_key, :bearer_token] do |t, args|
  api_test = APITest.new(
    api_key: args[:api_key]&.strip&.empty? ? nil : args[:api_key],
    bearer_token: args[:bearer_token]&.strip&.empty? ? nil : args[:bearer_token]
  )
  api_test.run
end
