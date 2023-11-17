function New-IntuneDriverUpdatePolicy
{
    <#
    .SYNOPSIS
        This function is to be used to create a Driver Policy within your intune tenant.
    .DESCRIPTION
        Based on the inputs, will depend on the policy creation type of Manual or Automatic.
    .EXAMPLE
        New-IntuneDriverUpdatePolicy  -policyType Automatic -deferralDays 1 -policyName "MyDriverUpdates" -policyDescription "My Graph Posted Policy"
    .PARAMETER policyType
        The type of policy to create. Manual or Automatic.
    .PARAMETER deferralDays
        The deferral days for the policy. This is only required for Automatic policies.
    .PARAMETER policyName
        The name of the policy to create.
    .PARAMETER policyDescription
        The description of the policy to create.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $policyName,
        [Parameter(Mandatory = $false)]
        [string]
        $policyDescription = $null,
        # Manual or Automatic Publishing Policy
        [Parameter(Mandatory = $true)]
        [ValidateSet("Manual", "Automatic")]
        [string]
        $policyType,
        [Parameter()]
        [string]
        $deferralDays = "0"
    )
    begin
    {
        #Initialise the base object body.
        $paramBody = @{
            displayName = $policyName
            description = $policyDescription
        }
    }
    process
    {
        switch ($policyType)
        {
            Manual
            {
                $paramBody.approvalType = "manual"
            }
            Automatic
            {
                $paramBody.approvalType = "automatic"
                $paramBody.deploymentDeferralInDays = $deferralDays
            }
        }
    }
    end
    {
        if ($PSCmdlet.ShouldProcess(
                'Creating a Intune Driver Update Policy',
                'Warning: Creating a Intune Driver Update Policy',
                'Question: Are you sure you want to do continue?'))
        {
            Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/beta/deviceManagement/windowsDriverUpdateProfiles" `
                -Method POST `
                -Body $paramBody `
                -ContentType 'application/json'
        }
    }
}