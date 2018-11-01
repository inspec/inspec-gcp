# Change Log

## [v0.7.0](https://github.com/inspec/inspec-gcp/tree/v0.7.0) (2018-11-01)
[Full Changelog](https://github.com/inspec/inspec-gcp/compare/v0.6.0...v0.7.0)

**Closed issues:**

- verifying via kitchen-terraform verifier [\#71](https://github.com/inspec/inspec-gcp/issues/71)

**Merged pull requests:**

- Extra nil checks, some error values changed [\#69](https://github.com/inspec/inspec-gcp/pull/69) ([alexpop](https://github.com/alexpop))
- Fix nil checks in google\_project\_logging\_audit\_config resource [\#68](https://github.com/inspec/inspec-gcp/pull/68) ([alexpop](https://github.com/alexpop))
- Fix nil exception when no zones are returned for a region [\#67](https://github.com/inspec/inspec-gcp/pull/67) ([alexpop](https://github.com/alexpop))
- Bump version to v0.6.0 [\#64](https://github.com/inspec/inspec-gcp/pull/64) ([skpaterson](https://github.com/skpaterson))

## [v0.6.0](https://github.com/inspec/inspec-gcp/tree/v0.6.0) (2018-10-18)
[Full Changelog](https://github.com/inspec/inspec-gcp/compare/v0.5.0...v0.6.0)

**Closed issues:**

- google\_project resource works with project ID/number instead of name as seen in the docs [\#39](https://github.com/inspec/inspec-gcp/issues/39)
- Improved firewall rule handling [\#27](https://github.com/inspec/inspec-gcp/issues/27)
- Enhancement: Support Fuzzy Match with Instance Group Name [\#23](https://github.com/inspec/inspec-gcp/issues/23)
- google\_compute\_instance\_group doesn't respond to exists? or exist?  [\#22](https://github.com/inspec/inspec-gcp/issues/22)
- google\_compute\_instance\_group: location symbol doesn't exist [\#21](https://github.com/inspec/inspec-gcp/issues/21)
- Node Pool fails requiring cluster\_id [\#20](https://github.com/inspec/inspec-gcp/issues/20)
- google\_container\_node\_pool.rb example bug [\#19](https://github.com/inspec/inspec-gcp/issues/19)
- found the documentation [\#17](https://github.com/inspec/inspec-gcp/issues/17)

**Merged pull requests:**

- Improve google\_project\#to\_s output [\#62](https://github.com/inspec/inspec-gcp/pull/62) ([adrienthebo](https://github.com/adrienthebo))
- Add service account auth instructions and example [\#60](https://github.com/inspec/inspec-gcp/pull/60) ([alexpop](https://github.com/alexpop))
- Adding google\_user\(s\) and project alert policy resources [\#59](https://github.com/inspec/inspec-gcp/pull/59) ([skpaterson](https://github.com/skpaterson))
- Added support for metadata and label content based compliance [\#58](https://github.com/inspec/inspec-gcp/pull/58) ([pleonovitch](https://github.com/pleonovitch))
- Updated Dockerfile with more layers and terraform [\#57](https://github.com/inspec/inspec-gcp/pull/57) ([jjasghar](https://github.com/jjasghar))
- Updates to controls affected by service account name change. [\#56](https://github.com/inspec/inspec-gcp/pull/56) ([skpaterson](https://github.com/skpaterson))
- Added resource doc links from recent PRs. [\#55](https://github.com/inspec/inspec-gcp/pull/55) ([skpaterson](https://github.com/skpaterson))
- Kubernetes resource updates [\#54](https://github.com/inspec/inspec-gcp/pull/54) ([skpaterson](https://github.com/skpaterson))
- Cloud SQL resources [\#53](https://github.com/inspec/inspec-gcp/pull/53) ([skpaterson](https://github.com/skpaterson))
- Storage updates [\#52](https://github.com/inspec/inspec-gcp/pull/52) ([skpaterson](https://github.com/skpaterson))
- VM Updates [\#51](https://github.com/inspec/inspec-gcp/pull/51) ([skpaterson](https://github.com/skpaterson))
- Networking related updates [\#50](https://github.com/inspec/inspec-gcp/pull/50) ([skpaterson](https://github.com/skpaterson))
- Project audit logging [\#49](https://github.com/inspec/inspec-gcp/pull/49) ([skpaterson](https://github.com/skpaterson))
- Minor fix for region instead of zone in first google\_compute\_region e… [\#48](https://github.com/inspec/inspec-gcp/pull/48) ([skpaterson](https://github.com/skpaterson))
-  Updates for service account and related resources [\#47](https://github.com/inspec/inspec-gcp/pull/47) ([skpaterson](https://github.com/skpaterson))
- Add google\_compute\_region\(s\) resources, tests etc. and updated README. [\#46](https://github.com/inspec/inspec-gcp/pull/46) ([skpaterson](https://github.com/skpaterson))
- Added google\_compute\_network\(s\) and google\_compute\_subnetwork\(s\) resources. [\#45](https://github.com/inspec/inspec-gcp/pull/45) ([skpaterson](https://github.com/skpaterson))
- Bump version to v0.5.0 [\#44](https://github.com/inspec/inspec-gcp/pull/44) ([skpaterson](https://github.com/skpaterson))

## [v0.5.0](https://github.com/inspec/inspec-gcp/tree/v0.5.0) (2018-08-21)
[Full Changelog](https://github.com/inspec/inspec-gcp/compare/v0.4.0...v0.5.0)

**Closed issues:**

- Unable to use resources provided by this library when invoked via test kitchen and kitchen-terraform [\#37](https://github.com/inspec/inspec-gcp/issues/37)

**Merged pull requests:**

- Resolve Debian 8 EOL issue, now pin all tf module versions explicitly. [\#43](https://github.com/inspec/inspec-gcp/pull/43) ([skpaterson](https://github.com/skpaterson))
- Added project logging resources [\#42](https://github.com/inspec/inspec-gcp/pull/42) ([skpaterson](https://github.com/skpaterson))
- Add storage bucket IAM resources [\#41](https://github.com/inspec/inspec-gcp/pull/41) ([skpaterson](https://github.com/skpaterson))
- Update the google\_project version as per \#39.  Also udpate the associ… [\#40](https://github.com/inspec/inspec-gcp/pull/40) ([skpaterson](https://github.com/skpaterson))
- Add kms resources [\#36](https://github.com/inspec/inspec-gcp/pull/36) ([skpaterson](https://github.com/skpaterson))
- Bump version to 0.4.0 [\#34](https://github.com/inspec/inspec-gcp/pull/34) ([skpaterson](https://github.com/skpaterson))
- Add iam resources [\#33](https://github.com/inspec/inspec-gcp/pull/33) ([skpaterson](https://github.com/skpaterson))

## [v0.4.0](https://github.com/inspec/inspec-gcp/tree/v0.4.0) (2018-06-25)
[Full Changelog](https://github.com/inspec/inspec-gcp/compare/v0.3.0...v0.4.0)

**Merged pull requests:**

- Add more resources [\#32](https://github.com/inspec/inspec-gcp/pull/32) ([skpaterson](https://github.com/skpaterson))
- Fw small fix [\#31](https://github.com/inspec/inspec-gcp/pull/31) ([skpaterson](https://github.com/skpaterson))
- Improved firewall resource [\#30](https://github.com/inspec/inspec-gcp/pull/30) ([skpaterson](https://github.com/skpaterson))
- README improvements and update resource docs to make more accessible. [\#29](https://github.com/inspec/inspec-gcp/pull/29) ([skpaterson](https://github.com/skpaterson))

## [v0.3.0](https://github.com/inspec/inspec-gcp/tree/v0.3.0) (2018-06-14)
**Closed issues:**

- update google\_project inline documentation [\#12](https://github.com/inspec/inspec-gcp/issues/12)
- add missing documentation [\#11](https://github.com/inspec/inspec-gcp/issues/11)
- google\_compute\_instance does not return the right value for machine\_type [\#10](https://github.com/inspec/inspec-gcp/issues/10)

**Merged pull requests:**

- Bump version and corrected minimum inspec version in root config file. [\#28](https://github.com/inspec/inspec-gcp/pull/28) ([skpaterson](https://github.com/skpaterson))
- Fixes according to issues: \#19, \#20, \#21 and \#22. [\#24](https://github.com/inspec/inspec-gcp/pull/24) ([skpaterson](https://github.com/skpaterson))
- Add plural resources [\#18](https://github.com/inspec/inspec-gcp/pull/18) ([skpaterson](https://github.com/skpaterson))
- Added missing documentation following InSpec standards, resolves \#11. [\#16](https://github.com/inspec/inspec-gcp/pull/16) ([skpaterson](https://github.com/skpaterson))
- Add FAQ for inspec exec errors when gcp transport is not specified.  … [\#15](https://github.com/inspec/inspec-gcp/pull/15) ([skpaterson](https://github.com/skpaterson))
- Update google\_project inline documentation and make other resource do… [\#14](https://github.com/inspec/inspec-gcp/pull/14) ([skpaterson](https://github.com/skpaterson))
- Adding machine\_size helper function to tidy up API response for machi… [\#13](https://github.com/inspec/inspec-gcp/pull/13) ([skpaterson](https://github.com/skpaterson))
- add kudos for @martezr [\#9](https://github.com/inspec/inspec-gcp/pull/9) ([chris-rock](https://github.com/chris-rock))
- Added minimum supported inspec version to inspec.yml [\#8](https://github.com/inspec/inspec-gcp/pull/8) ([skpaterson](https://github.com/skpaterson))
- Updating Gemfile to use latest inspec release.  Fix for only\_if test … [\#7](https://github.com/inspec/inspec-gcp/pull/7) ([skpaterson](https://github.com/skpaterson))
- update readme with api and quota settings [\#6](https://github.com/inspec/inspec-gcp/pull/6) ([chris-rock](https://github.com/chris-rock))
- add travis checks [\#5](https://github.com/inspec/inspec-gcp/pull/5) ([chris-rock](https://github.com/chris-rock))
- pass when terraform destory may fail [\#4](https://github.com/inspec/inspec-gcp/pull/4) ([chris-rock](https://github.com/chris-rock))
- Added configuration flag to separate resources requiring elevated pri… [\#3](https://github.com/inspec/inspec-gcp/pull/3) ([skpaterson](https://github.com/skpaterson))
- Inspec train gcp [\#2](https://github.com/inspec/inspec-gcp/pull/2) ([skpaterson](https://github.com/skpaterson))
- update readme [\#1](https://github.com/inspec/inspec-gcp/pull/1) ([chris-rock](https://github.com/chris-rock))



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*