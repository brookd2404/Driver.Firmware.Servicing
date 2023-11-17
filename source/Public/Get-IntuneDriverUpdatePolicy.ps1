function Get-IntuneDriverUpdatePolicy{
    <#
.SYNOPSIS
    This function gets all update of the policies for Windows Updates for Business for Driver and Firmware Servicing from Intune.
.DESCRIPTION
    This function gets all update of the policies for Windows Updates for Business for Driver and Firmware Servicing from Intune
.NOTES
    This has only been tested for the commercial driver and firmware updates.
    https://learn.microsoft.com/en-us/graph/api/adminwindowsupdates-list-updatepolicies?view=graph-rest-beta&tabs=http
.EXAMPLE
    # This will return all policies
    Get-IntuneDriverUpdatePolicy -All

    # This will return a specific policy by ID
    Get-IntuneDriverUpdatePolicy -policyID <policyID>

    # This will return all policies that are called Test
    Get-IntuneDriverUpdatePolicy -PolicyName "Test"
.PARAMETER policyID
    The policy ID to get. If not specified, all policies will be returned.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $policyID,
        [Parameter(Mandatory = $false)]
        [string]
        $PolicyName
    )
    process {
        try {
            if(([string]::IsNullOrEmpty($policyID)) -and ([string]::IsNullOrEmpty($PolicyName))){
                $policy = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/deviceManagement/windowsDriverUpdateProfiles" -All
            } elseif (-Not([string]::IsNullOrEmpty($PolicyID))) {
                $policy = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/deviceManagement/windowsDriverUpdateProfiles/$policyID"
            } elseif (-Not([string]::IsNullOrEmpty($PolicyName))) {
                $policies = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/deviceManagement/windowsDriverUpdateProfiles"
                $policy = $policies | Where-Object {$_.displayName -eq $PolicyName}
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