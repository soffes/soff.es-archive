desc 'Deploy to Heroku and push to GitHub'
task :deploy do
  unless `git status -s`.length == 0
    puts "WARNING: There are uncommitted changes"
    puts "Commit any changes before deploying."
    exit
  end
  
  `git push heroku master`
  `git push origin master`
end
