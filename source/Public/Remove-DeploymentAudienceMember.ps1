function Remove-DeploymentAudienceMember {
    <#
    .SYNOPSIS
        Remove members from a deployment audience for Windows Updates for Business
    .DESCRIPTION
        This function will check if the deployments audiences have the devices as members, and if so they will be removed from the audience.
    .EXAMPLE
        Remove-DeploymentAudienceMember -azureDeviceIDs ("ID1","ID2") -updateAudienceID <AudienceID>
    .PARAMETER azureDeviceIDs
        The Azure Device IDs to add to the audience.
    .PARAMETER policyID
        The Update Policy ID to get the audience from.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $azureDeviceIDs,
        # The Update Audience ID
        [Parameter(Mandatory = $true)]
        [string]
        $policyID

    )
    begin {
        # Create the param body base
        $paramBody = @{
            removeMembers = @(
            )
        }
    }
    process {
        if ($PSCmdlet.ShouldProcess("Remove members from the deployment audience")) {
            Write-Verbose "Removing members from the deployment audience"
        }
        else {
            return
        }
        $updateAudienceID = (Get-DriverUpdatePolicy -policyID $policyID).audience.id
        $updateAudienceMembers = Get-DeploymentAudienceMember -policyID $policyID
        foreach ($id in $azureDeviceIDs) {
            IF ($updateAudienceMembers.id -contains $id) {
                $memberObject = @{
                    "@odata.type" = "#microsoft.graph.windowsUpdates.azureADDevice"
                    id            = $id
                }
                $paramBody.removeMembers += $memberObject
            }
        }
    }
    end {
        IF ($paramBody.removeMembers.Count -ge 1) {
            Invoke-MgGraphRequest `
                -Method Post `
                -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$updateAudienceID')/updateAudience" `
                -Body $paramBody
        }
    }
}