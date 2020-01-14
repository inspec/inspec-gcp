## Upgrading from 0.x to 1.0

This guide is meant to help upgrade InSpec controls for the 1.0 version. There were several breaking changes that happened during this upgrade in the pursuit of a more unified experience across the inspec-gcp resources.

## Changes to undefined methods

Many resources in 0.x had methods dynamically defined based on the API response retrieved by that resource. This resulted in methods being undefined if the response did not contain that field, particularly in the case of optional fields on resources. Undefined method errors are tricky to handle from within an InSpec control, causing difficulty in writing tests against optional fields.

By migrating resources to be generated via [Magic Modules](https://github.com/GoogleCloudPlatform/magic-modules) they now have the schema of the underlying object, making it unnecessary to dynamically define methods.

What this means for you:

* If you depended on checking if methods were defined in inspec-gcp 0.x, you will need to rewrite controls. Checks for `.nil?` in 1.0 should function similarly to how checking if a method was defined in 0.x

* You can now safely check if an optional field is `nil` on resources

* Better documentation of the fields supported by a resource

* Much improved nested object traversal using the safe navigation operator (`&.`)

## IAM resource changes

### IAM bindings resources removed

All `*_iam_bindings` resources have been replaced with `*_iam_policy` resources that function in a similar fashion. `iam_policy` resources have the `bindings` field on them which functions in the same way as `iam_bindings` resources did in the past.

A control using the 0.x `storage_bucket_iam_bindings` resource similar to this:

```
  describe google_storage_bucket_iam_bindings(bucket: 'bucket-name') do
    it { should exist }
    its('iam_binding_roles') { should include "roles/storage.objectViewer" }
  end
```

Could be converted to a `storage_bucket_iam_policy` resource similar to:
```
  describe google_storage_bucket_iam_policy(bucket: 'bucket-name') do
    it { should exist }
    its('iam_binding_roles') { should include "roles/storage.objectViewer" }
  end
```

## Resource identifiers changes

### Long names -> individual identifiers

Several resources in 0.x were identified by a single string that combined multiple different identifiers into a single URL-like format. An example of this is in the `google_kms_crypto_key_iam_binding` resource that would take a single string as the identifier:

```
google_kms_crypto_key_iam_binding(crypto_key_url: 'projects/project/locations/europe-west2/keyRings/key-ring/cryptoKeys/key-name',  role: 'roles/owner') do
```

This creates a difficult situation where the user is required to know the format of the string and create it based on several different variables. In 1.0+ many of the constructor parameters have changed to simplify the use of these resources. For example, `google_kms_crypto_key_iam_binding` will take the following parameters in the future:

```
google_kms_crypto_key_iam_binding(project: "project", location: "location", key_ring_name: "key_ring_name", crypto_key_name: "name", role: "roles/editor") do
```

## Time field changes

Several resources (`google_storage_*` resources in particular) had methods ending in `_date` that would return the field parsed as a Ruby Time object. These have been simplified to always return as a Time object and renamed to remove the `_date` suffix to better match the API.

Example:
`google_storage_bucket_object.time_storage_class_updated_date` Renamed to `google_storage_bucket_object.time_storage_class_updated`

## Removed fields

* `google_container_cluster.zone`, a replacement can be found as `google_container_cluster.location`

## Container resources

* `google_container_regional_cluster` is removed, use `google_container_cluster`

* `google_container_regional_node_pool` is removed, use `google_container_node_pool`

* `google_container_cluster` and `google_container_node_pool` now use the the `location` field as an identifier rather than `zone`. They accept zones or regions as the `location` 