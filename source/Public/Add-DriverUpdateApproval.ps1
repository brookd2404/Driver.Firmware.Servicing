function Add-DriverUpdateApproval {
    <#
    .SYNOPSIS
        Add a driver update approval to a policy for Windows Updates for Business.
    .DESCRIPTION
        This function will add a driver update approval to a policy for Windows Updates for Business.
        Note: The catalog entry must be applicable to the policy, this will be checked before adding the approval.
    .EXAMPLE
        Add-DriverUpdateApproval -policyIDs ("ID1","ID2") -catalogEntryID <CatalogEntryID>
    .PARAMETER policyIDs
        The policy IDs to add the approval to.
    .PARAMETER catalogEntryID
        The catalog entry ID to add to the policy.
    .PARAMETER deferDays
        The days to defer the deployment of the driver update.
    .PARAMETER return
        Return the response from the API.
    #>
    [CmdletBinding()]
    [OutputType("System.Array", ParameterSetName = "return")]
    param (
        [Parameter(Mandatory = $true)]
        [array]
        $policyIDs,
        # The catalog entry ID, use Get-DriverUpdatePolicyApplicableContent to get the ID.
        [Parameter(Mandatory = $true)]
        [string]
        $catalogEntryID,
        # The days to defer the deployment of the driver update.
        [Parameter()]
        [int]
        $deferDays = 0,
        [parameter(ParameterSetName = "return", Mandatory = $false, dontShow = $true)]
        [array]
        $return = @()
    )
    begin {
        # Create the param body base
        $paramBody = @{
            "@odata.type" = "#microsoft.graph.windowsUpdates.contentApproval"
            content = @{
                "@odata.type" = "#microsoft.graph.windowsUpdates.catalogContent"
                catalogEntry = @{
                    "@odata.type" = "#microsoft.graph.windowsUpdates.driverUpdateCatalogEntry"
                    id = $catalogEntryID
                }
            }
            deploymentSettings = @{
                "@odata.type" = "microsoft.graph.windowsUpdates.deploymentSettings"
                schedule = @{
                    startDateTime = ""
                }
            }
        }
    }
    process {
        foreach ($policyID in $policyIDs) {
            $applicableConent = Get-DriverUpdatePolicyApplicableContent -policyID $policyID
            if ($applicableConent.catalogEntry.id -contains $catalogEntryID) {
                $startDate = (Get-Date).AddDays($deferDays).ToString("yyyy-MM-ddT00:00:00Z")
                try {
                    $paramBody.deploymentSettings.schedule.startDateTime = $startDate
                    $responce = Invoke-MgGraphRequest `
                        -Method POST `
                        -Uri "https://graph.microsoft.com/beta/admin/windows/updates/updatePolicies('$policyID')/complianceChanges" `
                        -Body $paramBody
                    $return += $responce
                }
                catch {
                    throw "Error adding the catalog entry ID to the policy ID: $policyID"
                }

            } else {
                Write-Warning "The catalog entry ID is not applicable to the policy ID: $policyID"
            }

        }
    }
    end {
        $return
    }
}