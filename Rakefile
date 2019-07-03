#!/usr/bin/env rake

require 'rake/testtask'
require 'rubocop/rake_task'
#require 'inifile'
require_relative 'test/integration/configuration/gcp_inspec_config'

# Rubocop
desc 'Run Rubocop lint checks'
task :rubocop do
  RuboCop::RakeTask.new
end

# lint the project
desc 'Run robocop linter'
task lint: [:rubocop]

# run tests
task default: [:lint, 'test:check']

namespace :test do
  # Specify the directory for the integration tests
  integration_dir = "test/integration"

  # Specify the terraform plan name
  plan_name = "inspec-gcp.plan"

  # Specify the file_name for terraform variables to be stored
  variable_file_name = "inspec-gcp.tfvars"

  # The below file allows to inject parameters as profile attributes to inspec
  profile_attributes = "gcp-inspec-attributes.yaml"

  # run inspec check to verify that the profile is properly configured
  task :check do
    dir = File.join(File.dirname(__FILE__))
    sh("bundle exec inspec check #{dir}")
    # run inspec check on the sample profile to ensure all resources are loaded okay
    # Disabling inspec check on profile with path dependency due to https://github.com/inspec/inspec/issues/3571
    #sh("cd #{integration_dir}/verify && bundle exec inspec check .")
  end
  

  task :init_workspace do
    # Initialize terraform workspace
    cmd = format("cd %s/build/ && terraform init -upgrade", integration_dir)
    sh(cmd)
  end

  task :generate_integration_test_variables do
    puts "----> Generating terraform and inspec variable files"
    #p GCPInspecConfig.config[:gcp_project_id]
    GCPInspecConfig.store_json(variable_file_name)
    GCPInspecConfig.store_yaml(profile_attributes)
  end

  task :plan_integration_tests do

    Rake::Task["test:generate_integration_test_variables"].execute

    puts "----> Setup"
    # Create the plan that can be applied to GCP
    cmd = format("cd %s/build/ && terraform plan  -var-file=%s -out %s", integration_dir, variable_file_name, plan_name)
 #   puts cmd
    sh(cmd)

  end

  task :setup_integration_tests do
    # Apply the plan on GCP
    cmd = format("cd %s/build/ && terraform apply %s", integration_dir, plan_name)
    sh(cmd)
  end

  task :run_integration_tests do
    puts "----> Run"
    # Since the default behaviour is to skip tests, the below absorbs an inspec "101 run okay + skipped only" exit code as successful
    cmd = format("bundle exec inspec exec %s/verify --attrs %s/build/%s -t gcp://; rc=$?; if [ $rc -eq 0 ] || [ $rc -eq 101 ]; then exit 0; else exit 1; fi", integration_dir, integration_dir, profile_attributes)
    sh(cmd)
  end

  task :cleanup_integration_tests do
    puts "----> Cleanup"
    cmd = format("cd %s/build/ && terraform destroy -force -var-file=%s || true", integration_dir, variable_file_name)
    sh(cmd)

  end

  desc "Perform Integration Tests"
  task :integration do
    Rake::Task["test:init_workspace"].execute
    if File.exists?(File.join(integration_dir,"build",variable_file_name))
      Rake::Task["test:cleanup_integration_tests"].execute
    end
    Rake::Task["test:plan_integration_tests"].execute
    Rake::Task["test:setup_integration_tests"].execute
    Rake::Task["test:run_integration_tests"].execute
    Rake::Task["test:cleanup_integration_tests"].execute
  end
end

# Automatically generate a changelog for this project. Only loaded if
# the necessary gem is installed.
# use `rake changelog to=1.2.0`
begin
  v = ENV['to']
  require 'github_changelog_generator/task'
  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.future_release = v
  end
rescue LoadError
  puts '>>>>> GitHub Changelog Generator not loaded, omitting tasks'
end
