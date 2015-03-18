host_and_port = if ENV['REDIS_HOST']
                  '%s:6379' % ENV['REDIS_HOST']
                elsif ENV['REDIS_PORT_6379_TCP_ADDR'] && ENV['REDIS_PORT_6379_TCP_PORT']
                  '%s:%s' % [ ENV['REDIS_PORT_6379_TCP_ADDR'], ENV['REDIS_PORT_6379_TCP_PORT'] ]
                else
                  'localhost:6379'
                end

options = { url: "redis://#{host_and_port}" }

Sidekiq.configure_server do |config|
  config.redis = options
end

Sidekiq.configure_client do |config|
  config.redis = options
end
