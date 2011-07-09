set :application, "sharedio"
set :repository,  "git@github.com:hlxwell/sharedio.git"
set :deploy_to, "/home/sharedio/app"
set :scm, :git
set :user, "sharedio"
set :use_sudo, false

# for unicorn
set :unicorn_binary, "/opt/ruby-enterprise-1.8.7-2010.02/bin/unicorn"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

role :web, "itjob.fm"                          # Your HTTP server, Apache/etc
role :app, "itjob.fm"                          # This may be the same as your `Web` server
role :db,  "itjob.fm", :primary => true        # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :init_project do
    run "cd #{release_path}; cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "cd #{release_path}; ln -s #{shared_path}/uploads #{release_path}/public"

    run "cd #{release_path}; bundle install"
    run "cd #{release_path}; rake db:create RAILS_ENV=production"
    run "cd #{release_path}; rake db:migrate RAILS_ENV=production"
  end

  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end

  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end

before "deploy:symlink", "deploy:init_project"