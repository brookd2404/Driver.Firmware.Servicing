function Revoke-DriverUpdateApproval {
    <#
    .SYNOPSIS
        Revoke a driver update approval from a policy for Windows Updates for Business.
    .DESCRIPTION
        This function will revoke a driver update approval from a policy for Windows Updates for Business.

        This function will find the compliance change ID for the update and revoke it based on the catalogEntry ID.
    .EXAMPLE
        Revoke-DriverUpdateApproval -policyIDs ("ID1","ID2") -catalogEntryID <catalogEntryID>
    .PARAMETER policyIDs
        The policy IDs to revoke the approval from.
    .PARAMETER catalogEntryID
        The update catalog entry ID.
    .PARAMETER return
        Return the response from the API.
    #>
    [CmdletBinding(SupportsShouldProcess = $true)]
    [OutputType("System.Array", ParameterSetName = "return")]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $policyIDs,
        # The catalog entry ID, use Get-DriverUpdatePolicyApplicableContent to get the ID.
        [Parameter(Mandatory = $true)]
        [string]
        $catalogEntryID,
        [Parameter(ParameterSetName = "return", Mandatory = $false, dontShow = $true)]
        [array]
        $return = @()
    )
    begin {
        # Create the param body base
        $paramBody = @{
            "@odata.type" = "#microsoft.graph.windowsUpdates.contentApproval"
            isRevoked = $true
        }
    }
    process {
        if ($PSCmdlet.ShouldProcess("Revokes a driver update approval from a policy for Windows Updates for Business",
            "Revokes a driver update approval from a policy for Windows Updates for Business",
            "Do you want to revoke the driver update approval from a policy for Windows Updates for Business?"
            )
        ) {
            try {
                foreach ($policyID in $policyIDs)
                {
                    Write-Verbose "Getting the compliance change ID for the update for policy $policyID"
                    $policyComplianceChanges = Get-DriverUpdatePolicyComplianceChange -policyID $policyID -catalogEntryID $catalogEntryID
                    foreach ($complianceChange in $policyComplianceChanges)
                    {
                        if ($complianceChange.isRevoked) {
                            Write-Verbose "The driver update approval for policy $policyID is already revoked"
                            continue
                        } else {
                            Write-Verbose "Revoking the driver update approval for policy $policyID"
                            $response = Invoke-MgGraphRequest -Method PATCH -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies('$policyID')/complianceChanges/$($complianceChange.id)" -Body $paramBody -ContentType "application/json"
                            Write-Verbose "Successfully revoked the driver update approval for policy $policyID, with compliance change ID $($complianceChange.id)"
                            $return += $response# Action when all if and elseif conditions are false #>
                        }
                    }
                }
            }
            catch {
                throw "Unable to revoke the driver update approval for policy $policyID. Error: $($_.Exception.Message)"
            }
        }
        else {
            return
        }
    }
    end {
        return $return
    }
}