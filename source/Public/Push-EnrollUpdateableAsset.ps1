function Push-EnrollUpdateableAsset {
    <#
    .SYNOPSIS
        This script is to be used to push enrol assets as without it, the delay could be significant.
    .DESCRIPTION
        This script is to be used to push enrol assets as without it, the delay could be significant.
    .NOTES
        This has only been tested for the commercial driver and firmware updates.
    .EXAMPLE
        Push-EnrollUpdateableAsset -azureDeviceIDs ('ID1','ID2')
    .PARAMETER azureDeviceIDs
        The Azure AD Device IDs to enroll as updateable assets.
    #>
    [CmdletBinding(ShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $azureDeviceIDs
    )
    begin {
        # Create the param body base
        $paramBody = @{
            updateCategory = "driver"
            assets         = @(
            )
        }
    }
    process {
        $updatableAssets = Get-UpdatableAssets
        foreach ($id in $azureDeviceIDs) {
            IF (-Not($updatableAssets | Where-Object { $_.id -match $id }).enrollments.updateCategory -notcontains "driver") {
                $memberObject = @{
                    "@odata.type" = "#microsoft.graph.windowsUpdates.azureADDevice"
                    id            = $id
                }
                $paramBody.assets += $memberObject
            }
        }
    }
    end {
        IF ($paramBody.assets.Count -ge 1) {
            Invoke-MgGraphRequest `
                -Method POST `
                -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatableAssets/enrollAssets" `
                -Body $paramBody
        }
    }
}