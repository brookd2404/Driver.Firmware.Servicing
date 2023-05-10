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
        Write-Verbose "Creating the param body for the request."
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
        Write-Verbose "Processing Count: $($policyIDs.count)"
        foreach ($policyID in $policyIDs) {
            Write-Verbose "Getting the applicable content for the policy ID: $policyID"
            $applicableConent = Get-DriverUpdatePolicyApplicableContent -policyID $policyID
            if ($applicableConent.catalogEntry.id -contains $catalogEntryID) {
                Write-Verbose "The catalog entry ID is applicable to the policy ID: $policyID"
                Write-Verbose "Adding the catalog entry ID with the defer days of $deferDays to the policy ID: $policyID"
                $startDate = (Get-Date).AddDays($deferDays).ToString("yyyy-MM-ddT00:00:00Z")
                try {
                    Write-Verbose "Adding the catalog entry ID to the policy ID: $policyID"
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
        Write-Verbose "Returning the responce from the API."
        $return
    }
}