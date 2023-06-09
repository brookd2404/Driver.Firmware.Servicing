function Get-DeploymentAudience {
    <#
    .SYNOPSIS
        This function get Update Deployment Audiences.
    .DESCRIPTION
        This function get Update Deployment Audiences.
    .NOTES
        This has only been tested for the commercial driver and firmware updates.
    .EXAMPLE
        Get-DeploymentAudience
        Get-DeploymentAudience -audienceID <audienceID>
    .PARAMETER audienceID
        The audience ID to get the deployment audience for.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $audienceID
    )
    process {
        try {
            IF ([string]::IsNullOrEmpty($audienceID)) {
                Write-Verbose "Getting all deployment audiences because no audienceID was specified."
                $DriverUpdateDeploymentAudience = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences" -All
            }
            elseif (-Not([string]::IsNullOrEmpty($audienceID))) {
                Write-Verbose "Getting the deployment audience for the audienceID '$audienceID'."
                $DriverUpdateDeploymentAudience = Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences?`$filter=id eq '$audienceID'"
            }
        }
        catch {
            throw "Unable to get the deployment audiences. $($_.Exception.Message)"
        }
    }
    end {
        Write-Verbose "Returning the deployment audience(s)."
        return $DriverUpdateDeploymentAudience
    }
}