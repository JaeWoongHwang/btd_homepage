# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "app-server"
set :repo_url, "https://github.com/JaeWoongHwang/btd_homepage.git"

set :deploy_to, '/var/www/html/btd_homepage'
set :bundle_flags, ""
set :user_sudo, true

#passenger restart permission
set :passenger_restart_with_sudo, true
set :passenger_restart_with_touch, true
set :passenger_in_gemfile, true

set :passenger_restart_options,
    -> { "#{deploy_to} --ignore-app-not-running --rolling-restart" }

set :linked_dirs, %w{log}
set :linked_files, %w{config/master.key}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 20 do
      # Your restart mechanism here, for example:
      # execute :rake, "assets:precompile"
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
