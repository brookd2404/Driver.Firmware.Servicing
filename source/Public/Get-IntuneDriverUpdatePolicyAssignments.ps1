function Get-IntuneDriverUpdatePolicyAssignments {
    <#
.SYNOPSIS
    This function gets the assignments for a Driver Policy within Intune
.DESCRIPTION
    This function gets the assignments for a Driver Policy within Intune
.NOTES
    This has only been tested for the commercial driver and firmware updates.
    https://learn.microsoft.com/en-us/graph/api/adminwindowsupdates-list-updatepolicies?view=graph-rest-beta&tabs=http

    You can get the group ID by using (Get-IntuneDriverUpdatePolicyAssignments -policyID <PolicyID>).id.split('_') | Where-Object {$_ -ne "<PolicyID"}
.EXAMPLE
    Get-IntuneDriverUpdatePolicyAssignments -policyID <PolicyID>
.PARAMETER policyID
    The policy ID to get the assignments for.
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $policyID
    )
    process {
        try {
            $assignments = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/deviceManagement/windowsDriverUpdateProfiles/$($PolicyID)/assignments"
        }
        catch {
            throw "Unable to get the policies. $($_.Exception.Message)"
        }
    }
    end {
        return $assignments
    }
}