function Get-DeploymentAudienceMember {
    <#
.SYNOPSIS
    This function will get the members of a deployment audience for Windows Updates for Business.
.DESCRIPTION
    This function will get the members of a deployment audience for Windows Updates for Business.
.NOTES
    This has only been tested for the commercial driver and firmware updates.
.EXAMPLE
    Get-DeploymentAudienceMember -policyID <PolicyID>
.PARAMETER policyID
    The policy ID to get the members for.
.PARAMETER audienceID
    The audience ID to get the members for.
.NOTES
    You can specify either the audienceID or policyID parameter, if both are specified the audienceID will be used.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $policyID,
        [Parameter(Mandatory = $false)]
        [string]
        $audienceID
    )
    begin {
        Write-Verbose "Checking to make sure either the audienceID or policyID parameter was specified."
        if ([String]::IsNullOrEmpty($audienceID) -and ([String]::IsNullOrEmpty($policyID))) {
            throw "You must specify either the audienceID or policyID parameter."
        }
    }
    process {
        try {
            Write-Verbose "Getting the members of the deployment audience."
            if(-Not([String]::IsNullOrEmpty($audienceID))) {
                Write-Verbose "Using the audienceID parameter to get the members of the deployment audience."
                $members = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$($audienceID)')/members" -All
            }
            ELSEIF (-Not([String]::IsNullOrEmpty($policyID))) {
                Write-Verbose "Using the policyID parameter to get the members of the deployment audience."
                $policy = Get-DriverUpdatePolicy -policyID $policyID
                $members = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$($policy.audience.id)')/members" -All
            }
        }
        catch {
            throw "Unable to get the members of the deployment audience. $($_.Exception.Message)"
        }
    }
    end {
        Write-Verbose "Returning the members of the deployment audience."
        return $members
    }
}