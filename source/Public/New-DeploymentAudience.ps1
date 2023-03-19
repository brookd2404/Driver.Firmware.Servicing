function New-DeploymentAudience {
    <#
    .SYNOPSIS
        Creates a WUfBDS Deployment Audience
    .DESCRIPTION
        Creates a WUfBDS Deployment Audience for Policy Assignment.
    .EXAMPLE
        New-DeploymentAudience
    .PARAMETER daAudienceParams
        The parameters to create the deployment audience.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        $daAudienceParams = @{}
    )
    process {

        if ($pscmdlet.ShouldProcess(
            'Creating a WUfBDS Deployment Audience',
            'Warning: Creating a WUfBDS Deployment Audience',
            'Question: Are you sure you want to do continue?'))
        {
            $daAudience = Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/deploymentAudiences" -Method POST -Body $daAudienceParams
        }
    }
    end {
        return $daAudience
    }
}