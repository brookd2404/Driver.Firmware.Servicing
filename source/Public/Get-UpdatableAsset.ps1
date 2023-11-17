function Get-UpdatableAsset {
    <#
    .SYNOPSIS
        This function get all updateable assets for Windows Updates for Business.
    .DESCRIPTION
        This function get all updateable assets for Windows Updates for Business.
    .NOTES
        This has only been tested for the commercial driver and firmware updates.
    .EXAMPLE
        Get-UpdatableAsset
        Get-UpdatableAsset -EntraIDDeviceID <AzureADDeviceID>
    .PARAMETER AzureADDeviceID
        The Azure AD Device ID to get the updatable asset for.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $EntraIDDeviceID
    )
    process {
        try {
            IF ([string]::IsNullOrEmpty($EntraIDDeviceID)) {
                $updatableAsset = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatableAssets" -All
            }
            elseif (-Not([string]::IsNullOrEmpty($EntraIDDeviceID))) {
                $updatableAsset = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatableAssets/$EntraIDDeviceID"
            }
        }
        catch {
            throw "Unable to get the updatable assets. $($_.Exception.Message)"
        }
    }
    end {
        return $updatableAsset
    }
}