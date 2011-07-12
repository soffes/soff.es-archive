desc 'Prepare to deploy'
task :pack do
  `rm -rf public/stylesheets/*.css`
  `rm -rf public/images/icon-*.png`
  `bundle exec compass compile`
  puts 'Packed.'
end

desc 'Deploy to Heroku'
task :deploy => :pack do
  unless `git rev-parse HEAD` == `git rev-parse origin/master`
     puts "WARNING: HEAD is not the same as origin/master"
     puts "Run `git push` to sync changes."
     exit
   end
  
  `git push heroku master`
  `git push origin master`
end
