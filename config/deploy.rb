require 'capistrano/ext/multistage'
require "rvm/capistrano"
require "bundler/capistrano"

set :rvm_type, :user 
set :use_sudo,    false
set :application, "med"
set :repository,  "ssh://hs@188.166.51.156/home/hs/git/med.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "hs"

set :stages, ["staging", "production"]
set :default_stage, "staging"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do
  task :symlink_configs do
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
  
  task :symlink_data do
    run "ln -sf #{shared_path}/data #{release_path}/public/"
  end
  
  task :precompile_assets do
    run "cd #{release_path} && RAILS_ENV=production rake assets:precompile"
  end
  
  task :restart do
    run "[ -f #{current_path}/tmp/pids/unicorn.pid ] && kill -USR2 `cat #{current_path}/tmp/pids/unicorn.pid` && sleep 5 && kill `cat #{current_path}/tmp/pids/unicorn.pid.oldbin` || true"
  end
end
