set :application, "samsoff.es"

role :app, "#{application}"
role :web, "#{application}"
role :db, "#{application}", :primary => true

set :deploy_to, "/var/www/#{application}"

set :user, "samsoffes"
set :deploy_via, :remote_cache
set :use_sudo, false

# Git
set :scm, "git"
set :repository,  "git@github.com:samsoffes/#{application}.git"
set :branch, "master"
set :git_shallow_clone, 1
set :git_enable_submodules, 1

# Tasks
namespace :deploy do
  
  # Link configs
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
  end
  
  # Restart Passenger
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  # Nuke All
  desc "Nuke entire deploy_to directory"
  task :nuke_all do
    run "rm -rf #{deploy_to}/*"
  end
end

after "deploy:update_code", "deploy:symlink_shared"
