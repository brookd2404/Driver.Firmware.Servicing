function Update-DriverUpdatePatchDeferral {
    <#
    .SYNOPSIS
        This function is to be used to update the Patch Deferral on Update Policies.
    .DESCRIPTION
        This function is to be used to update the Patch Deferral on Update Policies.
    .NOTES
        This has only been tested for the commercial driver and firmware updates.
    .EXAMPLE
        Update-DriverUpdatePatchDeferral -policyID <id> -deferralTime P1D
        Explanation of the function or its result. You can include multiple The deferral time must be in the ISO8601 format.
    .PARAMETER policyID
        The Update Policy ID. You can get this from the Get-DriverUpdatePolicy function.
    .PARAMETER deferralTime
        The deferral time must be in the ISO8601 format.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        # The Update Policy ID
        [Parameter(Mandatory = $true)]
        [string]
        $policyID,
        # ISO8601 Timeformat for Deferral
        [Parameter(Mandatory = $true)]
        [string]
        $deferralTime
    )
    begin {
        #The Base Object for the post Body
        $paramBody = @{
            "@odata.type"         = "#microsoft.graph.windowsUpdates.updatePolicy"
            complianceChangeRules = @()
        }
        # Create the param body base
        $complianceChangeRules = (Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies/$policyID" -Method GET).complianceChangeRules
    }
    process {
        $paramBody.complianceChangeRules += $complianceChangeRules
        $paramBody.complianceChangeRules | foreach-object {
            $_.durationBeforeDeploymentStart = $deferralTime
        }
        $deferralTime | Out-Null #Adding in this line to stop the output of the deferral time
    }
    end {
        Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies/$policyID" -Method PATCH -Body $paramBody
    }
}
