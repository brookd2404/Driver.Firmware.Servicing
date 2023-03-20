function Get-DriverUpdatePolicyComplianceChange {
    <#
.SYNOPSIS
    This function will get the compliance changes for an update policy for Windows Updates for Business.
.DESCRIPTION
    This function will get the compliance changes for an update policy for Windows Updates for Business. This include the deployment schedule for the Driver Updates if Deferrals are configured.
.NOTES
    This has only been tested for the commercial driver and firmware updates.
.EXAMPLE
    Get-DriverUpdatePolicyComplianceChange -policyID <PolicyID>
.PARAMETER policyID
    The policy ID to get the applicable content for.
.PARAMETER catalogentryID
    The update catalog entry ID to get the compliance changes for.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $policyID,
        [Parameter()]
        [string]
        $catalogentryID
    )
    process {
        try {
            Write-Verbose "Getting compliance changes of the update policy: $policyID"
            $complainceChanges = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies('$($policyID)')/complianceChanges" -All
            if ([string]::IsNullOrEmpty($catalogentryID)) {
                Write-Verbose "Returning all compliance changes of the update policy: $policyID"
                $return = $complainceChanges
            }
            else {
                Write-Verbose "Returning compliance changes of the update policy: $policyID - for catalog entry ID: $catalogentryID"
                $return = $complainceChanges | Where-Object { $_.content.catalogEntry.id -eq $catalogentryID }
            }
        }
        catch {
            throw "Unable to get compliance changes of the update policy. $($_.Exception.Message)"
        }
    }
    end {
        return $return
    }
}