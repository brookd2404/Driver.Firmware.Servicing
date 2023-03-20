function Remove-DriverUpdatePolicy {
    <#
    .SYNOPSIS
        Deletes a Driver Update Policy for Windows Updates for Business.
    .DESCRIPTION
        This function will delete a Driver Update Policy for Windows Updates for Business.
    .EXAMPLE
        Remove-DriverUpdatePolicy -policyID 00000000-0000-0000-0000-000000000000
    .PARAMETER policyID
        The Update Policy ID to delete.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType([string])]
    param (
        # The Update Audience ID
        [Parameter(Mandatory = $true)]
        [string]
        $policyID

    )
    process {
        if ($PSCmdlet.ShouldProcess("Deletes the Driver Update Policy with ID $policyID",
            "Delete Driver Update Policy",
            "Do you want to delete the Driver Update Policy with ID $policyID?"
            )
        ) {
            try {
                #Get the Update Audience ID
                $audienceID = (Get-DriverUpdatePolicy -policyID $policyID).audience.id
                #Remove the deployment audience
                Remove-DeploymentAudience -audienceID $audienceID
                #Remove the update policy
                Invoke-MgGraphRequest `
                    -Method DELETE `
                    -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies('$policyID')"
            }
            catch {
                throw "Unable to delete the update policy. $($_.Exception.Message)"
            }
        }
        else {
            return
        }
    }
    end {
        return "Successfully deleted the Driver Update Policy with ID $policyID"
    }
}