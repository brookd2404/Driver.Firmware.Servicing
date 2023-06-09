#
# Module manifest for module 'Driver.Firmware.Servicing'
#
# Generated by: David Brook
#
# Generated on: 14/03/2023
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Driver.Firmware.Servicing.psm1'

# Version number of this module.
ModuleVersion = '1.0.15'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '2dce5334-b867-4cbb-8a2c-c56576934385'

# Author of this module
Author = 'David Brook'

# Company or vendor of this module
CompanyName = 'EUC365'

# Copyright statement for this module
Copyright = '(c) 2023 David Brook. All rights reserved.'

# Description of the functionality provided by this module
Description = 'A module to help with driver and firmware servicing using the Microsoft Graph API'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('Microsoft.Graph.Authentication')

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Add-DeploymentAudienceMember','Add-DriverUpdateApproval','Get-DeploymentAudience','Get-DeploymentAudienceMember','Get-DriverUpdatePolicy','Get-DriverUpdatePolicyApplicableContent','Get-DriverUpdatePolicyComplianceChange','Get-UpdatableAsset','New-DeploymentAudience','New-DriverUpdatePolicy','Push-EnrollUpdatableAsset','Remove-DeploymentAudience','Remove-DeploymentAudienceMember','Remove-DriverUpdatePolicy','Revoke-DriverUpdateApproval','Update-DriverUpdatePatchDeferral')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        Prerelease = ''
        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
          ReleaseNotes = '## [1.0.15] - 2023-03-22

## Added
- Functionality to Add-DeploymentAudienceMember to allow for using either the policyID or AudienceID
- Functionality to Get-DeploymentAudienceMember to allow for using either the policyID or AudienceID

## Fixed
- Renamed Push-EnrollUpdateableAsset to Push-EnrollUpdatableAsset to resolve a spelling error

## Added
- Updated Automation

'

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
