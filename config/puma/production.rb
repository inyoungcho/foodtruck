on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

bind 'tcp://0.0.0.0:3000'
threads 16,16
environment 'production'
daemonize
stdout_redirect 'log/puma.stdout.log', 'log/puma.stderr.log'