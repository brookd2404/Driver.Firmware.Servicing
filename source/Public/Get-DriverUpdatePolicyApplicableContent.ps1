function Get-DriverUpdatePolicyApplicableContent {
    <#
.SYNOPSIS
    This function will get the deployable content of a deployment audience based on a PolicyID for Windows Updates for Business.
.DESCRIPTION
    This function will get the deployable content of a deployment audience based on a PolicyID for Windows Updates for Business.
.NOTES
    This has only been tested for the commercial driver and firmware updates.
.EXAMPLE
    Get-DriverUpdatePolicyApplicableContent -policyID <PolicyID>
.PARAMETER policyID
    The policy ID to get the applicable content for.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $policyID
    )
    process {
        try {
            $policy = Get-DriverUpdatePolicy -policyID $policyID
            $applicableConent = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$($policy.audience.id)')/applicableContent?`$expand=catalogEntry" -All
        }
        catch {
            throw "Unable to get the applicable content of the deployment audience. $($_.Exception.Message)"
        }
    }
    end {
        return $applicableConent
    }
}