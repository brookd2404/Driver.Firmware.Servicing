function New-DriverUpdatePolicy {
    <#
    .SYNOPSIS
        This function is to be used to create a Driver Policy for WUfBDS
    .DESCRIPTION
        Based on the inputs, will depend on the policy creation type of Manual or Automatic.
    .EXAMPLE
        New-DriverUpdatePolicy -audienceID $daAudience.id -policyType Automatic -deferralTime PT1D
    .PARAMETER audienceID
        The Deployment Audience ID. This can be obtained from the Get-DeploymentAudience function.
    .PARAMETER policyType
        The type of policy to create. Manual or Automatic.
    .PARAMETER deferralTime
        The deferral time for the policy. This is only required for Automatic policies.
    #>
    [CmdletBinding(SupportsShouldProcess=$true)]
    param (
        # The Deployment Audience ID
        [Parameter(Mandatory = $true)]
        [string]
        $audienceID,
        # Manual or Automatic Publishing Policy
        [Parameter(Mandatory = $true)]
        [ValidateSet("Manual", "Automatic")]
        [string]
        $policyType,
        # ISO8601 Timeformat for Deferral
        [Parameter()]
        [string]
        $deferralTime = "PT0S"
    )
    begin {
        #Initialise the base object body.
        $paramBody = @{
            "@odata.type"                  = "#microsoft.graph.windowsUpdates.updatePolicy"
            audience                       = @{
                id = $audienceID
            }
            autoEnrollmentUpdateCategories = @(
                "driver"
            )
        }
    }
    process {
        switch ($policyType) {
            Manual {
                $paramBody.deploymentSettings = @{
                    schedule             = $null
                    monitoring           = $null
                    contentApplicability = $null
                    userExperience       = $null
                    expedite             = $null
                }
            }
            Automatic {

                $paramBody.deploymentSettings = @{
                    schedule             = $null
                    monitoring           = $null
                    contentApplicability = @{
                        offerWhileRecommendedBy = @(
                            "microsoft"
                        )
                        safeguard               = $null
                    }
                    userExperience       = $null
                    expedite             = $null
                }
                $paramBody.complianceChangeRules = @(
                    @{
                        "@odata.type"                 = "#microsoft.graph.windowsUpdates.contentApprovalRule"
                        durationBeforeDeploymentStart = $deferralTime
                        contentFilter                 = @{
                            "@odata.type" = "#microsoft.graph.windowsUpdates.driverUpdateFilter"
                        }
                    }
                )
            }
        }
    }
    end {
        if ($PSCmdlet.ShouldProcess(
                'Creating a WUfBDS Driver Update Policy',
                'Warning: Creating a WUfBDS Driver Update Policy',
                'Question: Are you sure you want to do continue?')) {
            Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies"`
                -Method POST `
                -Body $paramBody `
                -ContentType 'application/json'
        }
    }
}