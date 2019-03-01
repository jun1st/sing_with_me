# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "sing_with_me"
set :repo_url, "git@github.com:jun1st/sing_with_me.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/sing_with_me"

# Default value for :format is :airbrussh.
set :format, :pretty

set :format, :pretty
set :log_level, :debug
set :use_sudo, false
set :pty, false
set :deploy_via, :copy

set :puma_user, fetch(:user)
# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets')

set :rbenv_ruby, '2.6.0'
set :rbenv_path, '/home/deployer/.rbenv'
set :rbenv_type, :user
set :rbenv_map_bins, %w(rake gem bundle ruby rails)

# Default value for default_env is {}
set :default_env, path: "~/.rbenv/shims:~/.rbenv/bin:$PATH"

set :puma_threads, [0, 16]
set :puma_workers, 4
set :puma_preload_app, true
set :puma_init_active_record, true

