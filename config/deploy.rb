set :application, "pieceofthefuture"
set :deploy_to, "/home/emachnic/public_html/#{application}"
set :use_sudo, false
set :repository,  "git@github.com:emachnic/pieceofthefuture.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :user, "emachnic"
set :password, "Potf2011"
set :domain, "184.168.91.58"
ssh_options[:forward_agent] = true
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
