# Changelog for Driver.Firmware.Servicing

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed 
- Fixed a coding issue in the Push-EnrollUpdatableAsset function

## [1.0.17] - 2023-03-22
## Fixed
- Fixed an issue with the Add-DeploymentAudienceMember function where it was not processing the input correctly.

## Added
- Added Verbose output to the Add-DeploymentAudienceMember function
- Added Verbose output to the Add-DriverUpdateApproval function
- Added Verbose output to the Get-DeploymentAudience function
- Added Verbose output to the Get-DeploymentAudienceMember function

## [1.0.15] - 2023-03-22
## Added
- Functionality to Add-DeploymentAudienceMember to allow for using either the policyID or AudienceID
- Functionality to Get-DeploymentAudienceMember to allow for using either the policyID or AudienceID

## Fixed
- Renamed Push-EnrollUpdateableAsset to Push-EnrollUpdatableAsset to resolve a spelling error

## [1.0.11] - 2023-03-22

## Added
- Updated Automation

## [1.0.8] - 2023-03-21

## Added
-   Release Automation
## Fixed

- Failed Build Items Failing Tests

## [1.0.0] - 2023-03-20

## Added

- Remove-DriverUpdatePolicy: This will allow you to remove a Driver Update Policy
- Remove-DeploymentAudience: This will allow you to remove a Deployment Audience
- Add-DriverUpdateApproval: This will allow you to add a Driver Update Approval
- Revoke-DriverUpdateApproval: This will allow you to revoke a Driver Update Approval.

## Changed
- New-DriverUpdatePolicy: Changed input param from deploymentAudienceId to audienceID
- The names of a couple of the modules to be more descriptive

### Removed
- Removed an unneeded function

## [0.9.1] - 2023-03-16

### Added
- Get-DriverUpdatePolicyComplianceChanges : This will allow you to see the compliance change settings such as the schedule for updates.
### Fixed 
- Get-UpdatePolicy not returning the correct values

## [0.9.0] - 2023-03-15

### Fixed
- Incorrect Syntax

## [0.8.3] - 2023-03-15

### Added

- Initial Release of the Module.
- Remove Function for Deployments Audience
- Docs
