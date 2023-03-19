# Changelog for Driver.Firmware.Servicing

The format is based on and uses the types of changes according to [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## Added

- Remove-DriverUpdatePolicy: This will allow you to remove a Driver Update Policy
- Remove-DeploymentAudience: This will allow you to remove a Deployment Audience
- Add-DriverUpdateApproval: This will allow you to add a Driver Update Approval

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
