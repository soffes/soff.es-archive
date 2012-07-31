require 'rake/testtask'

Rake::TestTask.new(test: 'db:test:prepare') do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end
task default: :test

Rake::TestTask.new(:'test:integration' => 'db:test:prepare') do |t|
  t.libs << 'test'
  t.pattern = 'test/integration/**/*_test.rb'
end

Rake::TestTask.new(:'test:units' => 'db:test:prepare') do |t|
  t.libs << 'test'
  t.pattern = 'test/units/**/*_test.rb'
end
