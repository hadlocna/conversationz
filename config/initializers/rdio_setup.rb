CONFIG = Pathname.new(File.expand_path('../..', __FILE__))


# env_config = YAML.load_file(CONFIG.join('', 'rdio.yml'))

# env_config.each do |key, value|
#   ENV[key] = value
# end

# ENV['RDIO_OAUTH_CONSUMER'] = OAuth::Consumer.new(ENV["RDIO_CONSUMER_KEY"], ENV["RDIO_CONSUMER_SECRET"], :site => "http://api.rdio.com", :scheme => :header)
#$resp = $consumer.request(:post, '/1/search', nil, {}, 'method=search&query=Altaria&types=Track', { 'Content-Type' => 'application/x-www-form-urlencoded' })
