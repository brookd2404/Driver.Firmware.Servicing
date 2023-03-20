function Remove-DeploymentAudience {
    <#
    .SYNOPSIS
        Deletes a Deployment Audience for Windows Updates for Business.
    .DESCRIPTION
        This function will delete a Deployment Audience for Windows Updates for Business.
    .EXAMPLE
        Remove-DeploymentAudience -audienceID 00000000-0000-0000-0000-000000000000
    .PARAMETER audienceID
        The Update Policy ID to delete.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType([string])]
    param (
        # The Deployment Audience ID
        [Parameter(Mandatory = $true)]
        [string]
        $audienceID

    )
    process {
        if ($PSCmdlet.ShouldProcess("Deletes the Update Audience with ID $audienceID",
            "Delete Update Audience",
            "Do you want to delete the Update Audience with ID $audienceID?"
            )
        ) {
            try {
                Invoke-MgGraphRequest `
                    -Method DELETE `
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