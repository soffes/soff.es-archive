desc "Install gems that this app depends on. May need to be run with sudo."
namespace :gems do
  
  desc "Install necessary gems"
  task :install do
    dependencies = [
      "rdiscount --version >= 1.5.5",
      "jekyll --version >= 0.5.4",
      "haml --version >= 2.2.9",
      "compass --version 0.8.17"
    ]
    dependencies.each do |dependency|
      command = "gem install #{dependency} --source http://gemcutter.org -q"
      puts command
      system command
    end
  end
end

namespace :compass do
  desc "Start Compass watching the SASS directory"
  task :watch do
    system "compass -w -c compass.rb"
  end
end

desc "Start local server"
task :server do
  system "jekyll --server --auto"
end
