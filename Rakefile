desc 'Build'
task :build do
  system 'bundle exec jekyll build --config _config.yml --trace'
end

task default: :build

desc 'Clean'
task :clean do
  system 'rm -rf _site .jekyll-cache'
end

desc 'Local server'
task :server do
  system 'bundle exec jekyll serve --config _config.yml --trace --incremental'
end
