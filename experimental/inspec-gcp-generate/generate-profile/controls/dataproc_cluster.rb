require 'yaml'
require 'logger'

title 'Test GCP google_dataproc_cluster resource.'


control 'google_dataproc_cluster-1.0' do
  impact 1.0
  title 'google_dataproc_cluster resource test'

  plural_identifiers = []

  logger = Logger.new(STDOUT)
  logger.level = Logger::WARN
  logger.warn("Generating tests for google_dataproc_cluster")
  filters = []
  ignored_fields = []
  output_folder = ENV["OUTPUT_PATH"]
  
  if output_folder.nil?
    
    output_folder = File.join(File.dirname(__FILE__), '../../generated_tests')
    logger.warn("Undefined output folder path at variable OUTPUT_PATH. Defaulting to #{File.expand_path(output_folder)}")
  end

  Dir.mkdir(output_folder) unless File.exists?(output_folder)
  template_path = File.join(File.dirname(__FILE__), '../../generated_test_template.erb')
  config_folder = ENV["CNF_PATH"]
  logger.warn("Undefined configuration folder path at variable CNF_PATH. Ignoring configuration files")
  unless config_folder.nil?
    file_name = File.join(config_folder, "google_dataproc_cluster.yaml")
    if File.file?(file_name)
      config = YAML::load_file(file_name)
      config_filters = config['filters']
      config_filters.each do |filter_string|
        filter = eval "lambda { |resource| #{filter_string} }"
        filters.push(filter)
      end
      config_ignored = config['ignore_fields']
      ignored_fields += config_ignored
    end
  end
  project_name = ENV["GCP_PROJECT_NAME"]
  raise "Undefined project name, please set the GCP_PROJECT_NAME variable" if project_name.nil?
  plural_identifiers = [{project: project_name}]



  next_identifiers = []
  region_names = google_compute_regions(project: project_name).region_names
  region_names.each do |region_name|
    plural_identifiers.each do |plural_identifier|
      next_identifiers.push(plural_identifier.merge({region: region_name}))
    end
  end
  plural_identifiers = next_identifiers



  all_identifiers = []
  i = 0
  plural_identifiers.each do |plural_identifier|
    plural = google_dataproc_clusters(plural_identifier)
    identifiers = plural.identifiers
    
    identifiers.each do |identifier|
      all_identifiers.push(identifier)
      resource = google_dataproc_cluster(identifier)

      if filters.all? { |filter| filter.call(resource) }
        resource.dump(output_folder, template_path, i, ignored_fields)
        
        output = "Writing #{File.expand_path(output_folder)}/Cluster_#{i}.rb"
        describe output do
          it { should match /test/ }
        end   
        i += 1
      end
    end
  end

  all_ids_name = 'google_dataproc_cluster_identifiers.json'
#  File.open("#{output_folder}/#{all_ids_name}", 'w') do |file|
#    file.write(all_identifiers.to_json)
#  end
end
