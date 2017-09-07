require 'esa'
require 'pry'

ESA_ACCESS_TOKEN = ENV.fetch('ESA_ACCESS_TOKEN')
ESA_TEAM_NAME    = ENV.fetch('ESA_TEAM_NAME')
POSTS_DIR_PATH   = ENV.fetch('POSTS_DIR_PATH')

client = Esa::Client.new(access_token: ESA_ACCESS_TOKEN, current_team: ESA_TEAM_NAME)

post_metas = Dir.glob(File.join(POSTS_DIR_PATH, '*.md')).map do |path|
  meta = YAML.load_file(path)
  meta
end

post_metas.each do |post_meta|
  client.update_post(post_meta['number'], category: '/Archived/')
  puts "number: #{post_meta['number']} title: #{post_meta['title']} => Archived!"
  puts 'sleep 3 seconds'
  sleep 3
end

puts 'done!'
