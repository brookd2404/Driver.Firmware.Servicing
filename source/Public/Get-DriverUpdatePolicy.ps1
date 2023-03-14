function Get-DriverUpdatePolicy{
    <#
.SYNOPSIS
    This function gets all update  policies for Windows Updates for Business for Driver and Firmware Servicing.
.DESCRIPTION
    This function gets all update  policies for Windows Updates for Business for Driver and Firmware Servicing.
.NOTES
    This has only been tested for the commercial driver and firmware updates.
    https://learn.microsoft.com/en-us/graph/api/adminwindowsupdates-list-updatepolicies?view=graph-rest-beta&tabs=http
.EXAMPLE
    Get-DriverUpdatePolicy
.PARAMETER policyID
    The policy ID to get. If not specified, all policies will be returned.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $policyID
    )
    process {
        try {
            IF([string]::IsNullOrEmpty($policyID)){
                $policy = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies" -All
            } elseif (-Not([string]::IsNullOrEmpty($AzureADDeviceID))) {
                $policy = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatableAssets?`$filter=id eq '$policyID'"
            }
        }
        catch {
            throw "Unable to get the policies. $($_.Exception.Message)"
        }
    }
    end {
        return $policy
    }
}