require 'rubygems'
require 'bundler'
Bundler.require

$LOAD_PATH.unshift 'lib'
require 'soffes'

Dir.glob('lib/tasks/*.rake').each do |task|
  import task
end


task :"assets:precompile" do
  # Nothing, for now
end
