function Add-DriverUpdatePolicyAudienceMember {
    <#
    .SYNOPSIS
        Add members to a deployment audience for Windows Updates for Business
    .DESCRIPTION
        This function will check if the deployments audiences have the devices as members, and if not they will be added to the audience.
    .EXAMPLE
        Add-DriverUpdatePolicyAudienceMember -azureDeviceIDs ("ID1","ID2") -updateAudienceID <AudienceID>
    .PARAMETER azureDeviceIDs
        The Azure Device IDs to add to the audience.
    .PARAMETER updateAudienceID
        The Update Audience ID to add the members to.
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
            addMembers = @(
            )
        }
    }
    process {
        $updateAudienceMembers = Invoke-GetRequest `
            -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$updateAudienceID')/members" -All
        foreach ($id in $azureDeviceIDs) {
            IF (-Not($updateAudienceMembers.id -contains $id)) {
                $memberObject = @{
                    "@odata.type" = "#microsoft.graph.windowsUpdates.azureADDevice"
                    id            = $id
                }
                $paramBody.addMembers += $memberObject
            }
        }
    }
    end {
        IF ($paramBody.addMembers.Count -ge 1) {
            Invoke-MgGraphRequest `
                -Method POST `
                -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$updateAudienceID')/updateAudience" `
                -Body $paramBody
        }
    }
}