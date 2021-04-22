source 'https://rubygems.org'

gem 'bundle'
gem 'faraday', '>= 0.16.2'
gem 'google-api-client'
gem 'google-cloud'
gem 'googleauth'
gem 'inifile'
gem 'inspec-bin', '4.33.1'
gem 'rubocop', '>= 0.77.0'

if Gem.ruby_version.to_s.start_with?("2.5")
  # 16.7.23 required ruby 2.6+
  gem "chef-utils", "< 16.7.23" # TODO: remove when we drop ruby 2.5
end

group :development do
  gem 'github_changelog_generator'
  gem 'pry-coolline'
  gem 'rake'
  gem 'vcr'
  gem 'webmock'
end
