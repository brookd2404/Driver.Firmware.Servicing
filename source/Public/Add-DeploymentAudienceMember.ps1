function Add-DeploymentAudienceMember {
    <#
    .SYNOPSIS
        Add members to a deployment audience for Windows Updates for Business
    .DESCRIPTION
        This function will check if the deployments audiences have the devices as members, and if not they will be added to the audience.
    .EXAMPLE
        Add-DeploymentAudienceMember -azureDeviceIDs ("ID1","ID2") -audienceID <AudienceID>
    .PARAMETER azureDeviceIDs
        The Azure Device IDs to add to the audience.
    .PARAMETER audienceID
        The Update Audience ID to add the members to.
    .PARAMETER policyID
        The Update Policy ID to add the members to.
    .NOTES
        You can specify either the audienceID or policyID parameter, if both are specified the audienceID will be used.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $azureDeviceIDs,
        # The Update Audience ID
        [Parameter(Mandatory = $false)]
        [string]
        $audienceID,
        [Parameter(Mandatory = $false)]
        [string]
        $policyID
    )
    begin {
        if ([String]::IsNullOrEmpty($audienceID) -and ([String]::IsNullOrEmpty($policyID))) {
            throw "You must specify either the audienceID or policyID parameter."
        }
        # Create the param body base
        $paramBody = @{
            addMembers = @(
            )
        }
    }
    process {
        IF (-Not([String]::IsNullOrEmpty($audienceID))) {
            $updateAudienceMembers = Get-DeploymentAudienceMember -audienceID $audienceID
        }
        elseif (([String]::IsNullOrEmpty($policyID))) {
            $updateAudienceMembers = Get-DeploymentAudienceMember -policyID $policyID
        }
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
                -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences('$audienceID')/updateAudience" `
                -Body $paramBody
        }
    }
}