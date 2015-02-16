server "188.166.51.156", :app, :web, :db, :primary => true
set :deploy_to, "/var/www/med"
set :rails_env, 'production' 

after 'deploy:update_code', 'deploy:symlink_configs'
after 'deploy:symlink_configs', 'deploy:symlink_data'
after 'deploy:symlink_data', 'deploy:precompile_assets'
#after 'deploy:restart', 'deploy:precompile_assets'
