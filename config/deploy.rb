# config valid only for current version of Capistrano
lock "3.7.2"

set :application, "PushkinContestBot"
set :repo_url, "git@github.com:SashaShostyr/pushkin-contest-bot.git"

set :rvm_type, :user
set :rvm_ruby_version, '2.4.2'
set :deploy_to, '/var/www/PushkinContestBot/'
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids public/assets tmp/cache tmp/sockets vendor/bundle}
set :ssh_options, { :forward_agent => true  }
set :pty, false
#set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
#set :sidekiq_processes, 2
#set :sidekiq_log, "#{current_path}/log/sidekiq.log"
#set :sidekiq_role, :sidekiq
set :puma_preload_app, true
set :puma_init_active_record, true
