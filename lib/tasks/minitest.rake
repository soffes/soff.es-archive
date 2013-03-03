require 'rake/testtask'

Rake::Task['test'].clear
Rake::TestTask.new(test: 'db:test:prepare') do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end
task default: :test
