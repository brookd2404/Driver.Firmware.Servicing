#TODO Finish this module off 

function Revoke-DriverUpdate {
    <#
    .SYNOPSIS
    .DESCRIPTION
        This function will revoke a driver update approval from a policy for Windows Updates for Business.

        This function will find the compliance change ID for the update and revoke it based on the catalogEntry ID.
    .EXAMPLE
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $policyIDs,
        # The catalog entry ID, use Get-DriverUpdatePolicyApplicableContent to get the ID.
        [Parameter(Mandatory = $true)]
        [string]
        $catalogEntryID

    )
    begin {
        # Create the param body base
        $paramBody = @{
            "@odata.type" = "#microsoft.graph.windowsUpdates.contentApproval"
            isRevoked = $true
        }
    }
    process {
        if ($PSCmdlet.ShouldProcess("Revokes a driver update approval from a policy for Windows Updates for Business", 
            "Revokes a driver update approval from a policy for Windows Updates for Business",
            "Do you want to revoke the driver update approval from a policy for Windows Updates for Business?"
            )
        ) {
            try {
                $
                Invoke-MgGraphRequest `
                    -Method POST `
                    -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$audienceID')"
            }
            catch {
                throw "Unable to delete the update audience. $($_.Exception.Message)"
            }
        }
        else {
            return
        }
    }
    end {
        return "Successfully deleted the Update Audience with ID $audienceID"
    }
}