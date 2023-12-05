source 'https://rubygems.org'

gem 'bundle'
gem 'faraday', '>= 0.16.2'
gem 'google-api-client'
gem 'google-cloud'
gem 'googleauth'
gem 'inifile'
gem 'inspec-bin', '4.16.0'
# 1.58.0 released on December 01, 2023 (https://rubygems.org/gems/rubocop/versions/1.58.0) has update some cops that breaks our current lint
# This breaks the `return` statements in the `libraries/*`, `generate/*`, `build/*` files.
# We need to update our code to fix the linting issues, before we remove the version constraint.
# This is required to ensure that the linting is not broken in CI.
gem 'rubocop', '>= 0.77.0', '< 1.58.0'

group :development do
  gem 'github_changelog_generator'
  gem 'pry-coolline'
  gem 'rake'
  gem 'vcr'
  gem 'webmock'
end
