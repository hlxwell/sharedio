set :application, "sharedio"
set :repository,  "git@github.com:hlxwell/sharedio.git"
set :deploy_to, "/home/sharedio/app"
set :scm, :git
set :user, "sharedio"
set :use_sudo, false

role :web, "itjob.fm"                          # Your HTTP server, Apache/etc
role :app, "itjob.fm"                          # This may be the same as your `Web` server
role :db,  "itjob.fm", :primary => true        # This is where Rails migrations will run

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