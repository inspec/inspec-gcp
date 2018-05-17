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
task default: [:lint]

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
  #task :check do
  #  dir = File.join(File.dirname(__FILE__))
  #  sh("bundle exec inspec check #{dir}")
  #end

  task :init_workspace do
    # Initialize terraform workspace
    cmd = format("cd %s/build/ && terraform init", integration_dir)
    sh(cmd)
  end

  task :plan_integration_tests do

    # Determine the storage account name and the admin password
  #  sa_name = (0...15).map { (65 + rand(26)).chr }.join.downcase
  #  admin_password = Passgen::generate(length: 12, uppercase: true, lowercase: true, symbols: true, digits: true)

    # Use the first 4 characters of the storage account to create a suffix
  #  suffix = sa_name[0..3]

    puts "----> Generating terraform and inspec variable files"
    #p GCPInspecConfig.config[:gcp_project_id]
    GCPInspecConfig.store_json(variable_file_name)
    GCPInspecConfig.store_yaml(profile_attributes)

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
    # attribute_file=File.join(File.dirname(__FILE__), ".attribute.yml")
    # sh("cd #{integration_dir}/build/ && terraform output > #{attribute_file}")
    # raw_output = File.read(attribute_file)
    # yaml_output = raw_output.gsub(" = ", " : ")
    # File.open(attribute_file, "w") {|file| file.puts yaml_output}
  end

  task :run_integration_tests do
    puts "----> Run"
    # Since the default behaviour is to skip tests, the below absorbs an inspec "101 run okay + skipped only" exit code as successful
    cmd = format("bundle exec inspec exec %s/verify --attrs %s/build/%s -t gcp://; rc=$?; if [ $rc -eq 0 ] || [ $rc -eq 101 ]; then exit 0; else exit 1; fi", integration_dir, integration_dir, profile_attributes)
    sh(cmd)
  end

  task :cleanup_integration_tests do
    puts "----> Cleanup"
    #cmd = format("cd %s/build/ && terraform destroy -force -var 'project_id=%s' -var 'storage_account_name=%s' -var 'admin_password=%s' -var 'suffix=%s'", integration_dir, project_id, sa_name, admin_password, suffix)
    cmd = format("cd %s/build/ && terraform destroy -force -var-file=%s || true", integration_dir, variable_file_name)
    #   -var 'subscription_id=%s' -var 'client_id=%s' -var 'client_secret=%s' -var 'tenant_id=%s' -var 'admin_password=dummy' -var 'storage_account_name=dummy' -var 'suffix=dummy'", integration_dir, creds[:subscription_id], creds[:client_id], creds[:client_secret], creds[:tenant_id])
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
