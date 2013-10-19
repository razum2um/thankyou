set :application, 'thank_you'
set :repo_url, 'git@github.com:railsrumble/r13-team-550.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/www-data/thank_you'
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 3

# bundler
set :bundle_dir, -> { shared_path.join('bundle') }
set :bundle_flags, '--deployment --quiet'
set :bundle_without, %w{development test}.join(' ')
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_roles, :all
set :rake, 'bundle exec rake'

# rvm
set :rvm_type, :system
set :rvm_ruby_version, '2.0.0'

namespace :deploy do
  task :prepare do
    execute "(cd #{release_path} && RAILS_ENV=production bundle exec rake assets:precompile)"
    execute "(cd #{release_path} && RAILS_ENV=production bundle exec rake db:migrate)"
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -USR2 `cat #{release_path.join('tmp/pids/unicorn.pid')}`"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
  after 'deploy:updated', 'deploy:prepare'
end
