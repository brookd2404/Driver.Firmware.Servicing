function Push-EnrollUpdatableAsset {
    <#
    .SYNOPSIS
        This script is to be used to push enrol assets as without it, the delay could be significant.
    .DESCRIPTION
        This script is to be used to push enrol assets as without it, the delay could be significant.
    .NOTES
        This has only been tested for the commercial driver and firmware updates.
    .EXAMPLE
        Push-EnrollUpdatableAsset -azureDeviceIDs ('ID1','ID2')
    .PARAMETER azureDeviceIDs
        The Azure AD Device IDs to enrol as updatable assets.
    .NOTES
        This script is to be used to push enrol assets as without it, the delay could be significant. This is also a recommended step in the documentation from Microsoft.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $azureDeviceIDs
    )
    begin {
        Write-Verbose "Starting function $($MyInvocation.MyCommand.Name)"
        # Create the param body base
        Write-Verbose "Creating the param body base"
        $paramBody = @{
            updateCategory = "driver"
            assets         = @(
            )
        }
    }
    process {
        if($PSCmdlet.ShouldProcess("Enroll Assets", "Enroll Assets")) {
            Write-Verbose "Getting updatable assets"
            $updatableAssets = Get-UpdatableAsset
            Write-Verbose "Checking if the assets are already enrolled"
            foreach ($id in $azureDeviceIDs) {
                IF (-Not($updatableAssets | Where-Object { $_.id -match $id }).enrollments.updateCategory -notcontains "driver") {
                    Write-Verbose "Adding $id to the param body, as it is not already enrolled"
                    $memberObject = @{
                        "@odata.type" = "#microsoft.graph.windowsUpdates.azureADDevice"
                        id            = $id
                    }
                    $paramBody.assets += $memberObject
                }
                Write-Verbose "Param Body has $($paramBody.assets.Count) assets"
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
        Write-Verbose "Finished function $($MyInvocation.MyCommand.Name)"
    }
}