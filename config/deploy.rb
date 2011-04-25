set :application, "pieceofthefuture"
set :deploy_to, "/var/www/#{application}"
set :use_sudo, true
set :repository,  "git@git.assembla.com:git-of-the-future.git"
set :scm, :git
set :user, "emachnic"
set :password, "Potf2011"
set :domain, "184.168.91.58"
role :web, domain
role :app, domain
role :db,  domain, :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after :deploy, "passenger:restart"
