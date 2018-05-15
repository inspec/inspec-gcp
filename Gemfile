source 'https://rubygems.org'

gem 'inifile'
gem 'google-api-client'
gem 'googleauth'
gem 'google-cloud'
gem 'bundle'

group :development do
  gem 'rake'
  gem 'rubocop'
  gem 'github_changelog_generator'
  gem 'pry-coolline'
  gem 'passgen'
end

group :inspec do
  # Below are required until the next inspec release containing the train changes
  gem 'train', :git => 'https://github.com/chef/train.git'
  gem 'inspec', :git => 'https://github.com/chef/inspec.git', :branch => 'jq/add_train_gcp'
end
