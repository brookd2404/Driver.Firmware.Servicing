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
        Get-UpdatableAsset -AzureADDeviceID <AzureADDeviceID>
    .PARAMETER AzureADDeviceID
        The Azure AD Device ID to get the updatable asset for.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $AzureADDeviceID
    )
    process {
        try {
            IF ([string]::IsNullOrEmpty($AzureADDeviceID)) {
                $updatableAsset = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatableAssets" -All
            }
            elseif (-Not([string]::IsNullOrEmpty($AzureADDeviceID))) {
                $updatableAsset = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatableAssets?`$filter=id eq '$AzureADDeviceID'"
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