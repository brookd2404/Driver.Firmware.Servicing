# Driver.Firmware.Servicing

[![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/brookd2404/Driver.Firmware.Servicing/pipeline.yml?branch=main)](https://github.com/brookd2404/Driver.Firmware.Servicing/actions) 
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/brookd2404/Driver.Firmware.Servicing/main?color=blue)](https://github.com/brookd2404/Driver.Firmware.Servicing/commits/main) 
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/brookd2404/Driver.Firmware.Servicing?color=yellow)](https://github.com/brookd2404/Driver.Firmware.Servicing/releases/latest)
[![GitHub Release Date](https://img.shields.io/github/release-date/brookd2404/Driver.Firmware.Servicing?color=magenta)](https://github.com/brookd2404/Driver.Firmware.Servicing/releases/latest)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Driver.Firmware.Servicing?color=purple)](https://www.powershellgallery.com/packages/Driver.Firmware.Servicing)
[![GitHub all releases](https://img.shields.io/github/downloads/brookd2404/Driver.Firmware.Servicing/total?color=orange)](https://github.com/brookd2404/Driver.Firmware.Servicing/releases)

This repository contains the source code for the Driver.Firmware.Servicing PowerShell Module published on the [PowerShell Gallery](https://www.powershellgallery.com/packages/Driver.Firmware.Servicing/).

This module was authored to aid in the management of driver and firmware updates for devices via the Microsoft Graph API. This module is intended to provide a means to manage updates for devices easier than the current methods available.

# Prerequisites

This module requires the following:
1. PowerShell 5.1 or higher
2. A Microsoft 365 account with the appropriate permissions to manage WindowsUpdates in your organization
3. The Microsoft Graph PowerShell Authentication Module

<hr>

# Installation

This module is published on the [PowerShell Gallery](https://www.powershellgallery.com/packages/Driver.Firmware.Servicing/). To install the module, run the following command:

```powershell 
Install-Module -Name Driver.Firmware.Servicing
```
<hr>

# Usage

**ALL COMMANDS ARE DOCUMENTED BASED ON THEIR SYNOPSIS. THESE DOCS CAN BE FOUND IN THE [DOCS](docs) FOLDER**

## Authentication

To use this module, you must first authenticate to Microsoft Graph. To do this, run the following command:

```powershell
Connect-MgGraph -Scopes "WindowsUpdates.ReadWrite.All" -ContextScope Process
```

<hr>

## Policy Management

This module provides the ability to manage Windows Update for Business policies. This includes the ability to create, update, and delete policies. The following commands are available:

```powershell
Add-DeploymentAudienceMember
Add-DriverUpdateApproval
Get-DeploymentAudience
Get-DeploymentAudienceMember
Get-DriverUpdatePolicy
Get-DriverUpdatePolicyApplicableContent
Get-DriverUpdatePolicyComplianceChange
Get-UpdatableAsset
New-DeploymentAudience
New-DriverUpdatePolicy
Push-EnrollUpdatableAsset
Remove-DeploymentAudience
Remove-DeploymentAudienceMember
Remove-DriverUpdatePolicy
Revoke-DriverUpdateApproval
Update-DriverUpdatePatchDeferral
```
<hr>

# Examples

## Create a new policy

```powershell
#Create a deployment audience
$deploymentAudience = New-DeploymentAudience
#create a new automatic policy, deferring updates for 1 day
$policy = New-DriverUpdatePolicy -audienceID $deploymentAudience.id -policyType "Automatic" -deferralTime "P1D"
```
## Add a device to a policy

```powershell
#Array of Azure AD Device IDs
$deviceIDs = @("deviceID1","deviceID2")
#Explicitly Enrol the devices to the WUfBDS Driver Feature
Push-EnrollUpdatableAsset -deviceIDs $deviceIDs
#Add the devices to the deployment audience
Add-DeploymentAudienceMember -audienceID $deploymentAudience.id -azureDeviceIDs $deviceIDs
```

## Get a list of applicable content

```powershell
#Get a list of applicable content for the policy
Get-DriverUpdatePolicyApplicableContent -policyID $policy.id
```

## Get a list of compliance changes & view update schedule

```powershell
#Get a list of compliance changes for the policy
$complianceChanges = Get-DriverUpdatePolicyComplianceChange -policyID $policy.id
#View Update Schedule
$updateEntry = $complianceChanges | Where-Object {$_.content.catalogEntry.displayName -eq "Intel - System - 4/12/2017 12:00:00 AM - 14.28.47.630"}
$updateEntry.deploymentSettings.schedule
```

## Add a Driver Update Approval

```powershell
#Get the Update Catalog ID for the driver update.
$catalogID = (Get-DriverUpdatePolicyApplicableContent -policyID $policy.id | Where-Object {$_.catalogEntry.displayName -eq "Intel - System - 4/12/2017 12:00:00 AM - 14.28.47.630"}).catalogEntry.id
#Add the driver update approval and defer it for 2 days (Deferral time is set to 0 day in the policy)
Add-DriverUpdateApproval -policyIDs @($($policy.id),"PolicyID2") -catalogEntryID $catalogID -deferDays 2
```

## Revoke a Driver Update Approval

```powershell
#Get the Update Catalog ID for the driver update.
$catalogID = (Get-DriverUpdatePolicyApplicableContent -policyID $policy.id | Where-Object {$_.catalogEntry.displayName -eq "Intel - System - 4/12/2017 12:00:00 AM - 14.28.47.630"}).catalogEntry.id
#Revoke the driver update approval
Revoke-DriverUpdateApproval -policyIDs @($($policy.id),"PolicyID2") -catalogEntryID $catalogID
```

## Update a Driver Update Deferral

```powershell
#Update the deferral time for the policy
Update-DriverUpdatePatchDeferral -policyID $policy.id -deferralTime "P2D"
```