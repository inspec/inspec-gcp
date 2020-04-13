module GcpHelpers

    @gke_clusters_cached = false
    @gke_locations = []
    @gce_instances_cached = false
    @gce_zones = []

    def get_gke_clusters(gcp_project_id, gcp_gke_locations)
      unless @gke_clusters_cached == true
        # Reset the list of cached clusters
        @cached_gke_clusters = []
        begin
          # If we weren't passed a specific list/array of zones/region names from inputs, search everywhere 
          if gcp_gke_locations.join.empty?
            @gke_locations = google_compute_zones(project: gcp_project_id).zone_names
            @gke_locations += google_compute_regions(project: gcp_project_id).region_names
          else
            @gke_locations = gcp_gke_locations
          end

          # Loop/fetch/cache the names and locations of GKE clusters
          @gke_locations.each do |gke_location|
            google_container_clusters(project: gcp_project_id, location: gke_location).cluster_names.each do |gke_cluster|
              @cached_gke_clusters.push({:cluster_name => gke_cluster, :location => gke_location})
            end
          end

          # Mark the cache as full
          @gke_clusters_cached = true
        rescue NoMethodError
          # During inspec check, the mock transport connection doesn't set up a gcp_compute_client method
        end
      end
      # Return the list of clusters
      return @cached_gke_clusters
    end

    def get_gce_instances(gcp_project_id, gce_zones)
      unless @gce_instances_cached == true
        # Set the list of cached intances
        @cached_gce_instances = []
        begin
          # If we weren't passed a specific list/array of zone names from inputs, search everywhere 
          if gce_zones.join.empty?
            @gce_zones = google_compute_zones(project: gcp_project_id).zone_names
          else
            @gce_zones = gce_zones
          end

          # Loop/fetch/cache the names and locations of GKE clusters
          @gce_zones.each do |gce_zone|
            google_compute_instances(project: gcp_project_id, zone: gce_zone).instance_names.each do |instance|
              @cached_gce_instances.push({:name => instance, :zone => gce_zone})
            end
          end
          # Mark the cache as full
          @gce_instances_cached = true
        rescue NoMethodError
          # During inspec check, the mock transport connection doesn't set up a gcp_compute_client method
        end
      end
      # Return the list of clusters
      return @cached_gce_instances
    end

end

::Inspec::DSL.include(GcpHelpers)