function Get-DriverUpdatePolicyComplianceChange {
    <#
.SYNOPSIS
    This function will get the compliance changes for an update policy for Windows Updates for Business.
.DESCRIPTION
    This function will get the compliance changes for an update policy for Windows Updates for Business.
.NOTES
    This has only been tested for the commercial driver and firmware updates.
.EXAMPLE
    Get-DriverUpdatePolicyComplianceChange -policyID <PolicyID>
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
            $complainceChanges = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies('$($policyID)')/complianceChanges" -All
        }
        catch {
            throw "Unable to get compliance changes of the update policy. $($_.Exception.Message)"
        }
    }
    end {
        return $complainceChanges
    }
}