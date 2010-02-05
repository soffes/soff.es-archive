namespace :compass do
  desc "Start Compass watching the SASS directory"
  task :watch do
    system "compass -w -c compass.rb"
  end
end

desc "Start local server"
task :server do
  system "shotgun config.ru"
end

desc "Clean and rebuild the Jekyll site"
task :build do
  system "rm -rf _site && jekyll"
end
