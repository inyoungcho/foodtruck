require 'bundler/capistrano'
require 'puma/capistrano'

set :application, "foodtruck"

ssh_options[:forward_agent] = true

set :scm, :git
set :repository, "git@github.com:felixalias/#{application}.git"
set :branch, "master"

set :deploy_to, "/var/www/#{application}"

role :web, "aws-#{application}-1"                          # Your HTTP server, Apache/etc
role :app, "aws-#{application}-1"                          # This may be the same as your `Web` server
role :db,  "aws-#{application}-1", primary: true # This is where Rails migrations will run

namespace :deploy do  
  desc "Maintains a shared uploads directory between releases"
  task :symlink_shared do
    run "mkdir -p #{shared_path}/uploads && ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

before 'deploy:assets:precompile', 'deploy:symlink_shared'
after 'deploy:update_code', 'deploy:symlink_shared'

namespace :custom do
  namespace :rake do
    desc "Run a rake task remotely"
    # run like: cap rake:invoke task=db:migrate
    task :invoke do
      run "cd #{current_path}; /usr/bin/env bundle exec rake RAILS_ENV=production #{ENV['task']}"
    end
  end
end