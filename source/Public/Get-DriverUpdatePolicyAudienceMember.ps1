function Get-DriverUpdatePolicyAudienceMember {
    <#
.SYNOPSIS
    This function will get the members of a deployment audience for Windows Updates for Business.
.DESCRIPTION
    This function will get the members of a deployment audience for Windows Updates for Business.
.NOTES
    This has only been tested for the commercial driver and firmware updates.
.EXAMPLE
    Get-DriverUpdatePolicyAudienceMember -policyID <PolicyID>
.PARAMETER policyID
    The policy ID to get the members for.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $policyID
    )
    process {
        try {
            $policy = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies/$policyID" -All
            $members = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$($policy.audience.id)')/members" -All
        }
        catch {
            throw "Unable to get the members of the deployment audience. $($_.Exception.Message)"
        }
    }
    end {
        return $members
    }
}