set :user, 'ror'
set :domain, '192.168.20.104'
set :application, "fq"

#adjust if you are using RVM? remove if you are not
$:.unshift(File.expand_path('.lib', ENV['rvm_path']))

require "rvm/capistrano"

set :rvm_ruby_string, '1.9.3-p484'
set :rvm_type, :system

#file paths
set :repository,  "#{user}@#{domain}:git/#{application}.git"
set :deploy_to, "/var/www/#{user}/#{application}"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true


# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain
# This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after "deploy:update_code",:bundle_install
desc "install the necessary prerequisites"
#
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end

