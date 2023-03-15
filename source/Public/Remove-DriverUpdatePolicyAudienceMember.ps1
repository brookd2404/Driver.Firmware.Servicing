function Remove-DriverUpdatePolicyAudienceMember {
    <#
    .SYNOPSIS
        Remove members from a deployment audience for Windows Updates for Business
    .DESCRIPTION
        This function will check if the deployments audiences have the devices as members, and if so they will be removed from the audience.
    .EXAMPLE
        Remove-DriverUpdatePolicyAudienceMember -azureDeviceIDs ("ID1","ID2") -updateAudienceID <AudienceID>
    .PARAMETER azureDeviceIDs
        The Azure Device IDs to add to the audience.
    .PARAMETER updateAudienceID
        The Update Audience ID to remove the members from.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $azureDeviceIDs,
        # The Update Audience ID
        [Parameter(Mandatory = $true)]
        [string]
        $updateAudienceID

    )
    begin {
        # Create the param body base
        $paramBody = @{
            removeMembers = @(
            )
        }
    }
    process {
        $updateAudienceMembers = Get-DriverUpdatePolicyAudienceMember -policyID $updateAudienceID
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
                -Method POST `
                -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$updateAudienceID')/updateAudience" `
                -Body $paramBody
        }
    }
}