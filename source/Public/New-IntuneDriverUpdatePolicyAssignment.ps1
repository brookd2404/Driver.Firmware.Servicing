function New-IntuneDriverUpdatePolicyAssignment {
    <#
    .SYNOPSIS
        This function is to be used to add groups to a Driver Policy within Intune
    .DESCRIPTION
        This function is to be used to add groups to a Driver Policy within Intune
    .EXAMPLE
        New-IntuneDriverUpdatePolicyAssignment -assignmentGroupIDs '<Groupid1>','<Groupid2>' -policyID $policyID
    .PARAMETER assignmentGroupIDs
        The Entra ID Object ID of the group to add to the policy
    .PARAMETER PolicyID
        The ID of the policy to update
    #>
    [CmdletBinding(SupportsShouldProcess=$true)]
    param (
        # The Deployment Audience ID
        [Parameter(Mandatory = $true)]
        [array]
        $assignmentGroupIDs,
        [Parameter(Mandatory = $true, HelpMessage="The ID of the policy to update")]
        [string]
        $policyID
    )
    begin {
        #Initialise the base object body.
        $parambody = @{
            assignments = @(
            )
        }
    }
    process {
        $currentAssignments = (Get-IntuneDriverUpdatePolicyAssignments -policyID $policyID)
        IF ($currentAssignments) {
            Write-Verbose "Found existing assignments"
            $currentAssignments | Select-Object -Property Target | % {
                $target = @{
                    target = @{
                        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
                        groupId       = $_.target.groupId
                    }
                }
                $paramBody.assignments += $target
            }#Add current assignments to the param body as it would remove them if not
        } ELSE {
            Write-Verbose "No existing assignments found"
        }
        $currentAssignmentIds = (Get-IntuneDriverUpdatePolicyAssignments -policyID $policyID).id.split('_') | Where-Object {$_ -ne $policyID}
        FOREACH ($id in $assignmentGroupIDs) {
            if ($currentAssignmentIds -notcontains $id) {
                Write-Verbose "Adding $id to the param body, as it is not already enrolled"
                $target = @{
                    target = @{
                        "@odata.type" = "#microsoft.graph.groupAssignmentTarget"
                        groupId       = $id
                    }
                }
                $paramBody.assignments += $target
            } ELSE {
                Write-Verbose "Skipping $id as it is already a member of the policy"
            }
        }
    }
    end {
        if ($PSCmdlet.ShouldProcess(
                'Creating Intune Policy Assingments',
                'Warning: Creating Intune Policy Assingments',
                'Question: Are you sure you want to do continue?')) {
            IF ($paramBody.assignments.count -gt 0) {
                Invoke-MgGraphRequest -Uri "https://graph.microsoft.com/beta/deviceManagement/windowsDriverUpdateProfiles/$policyID/assign"`
                    -Method POST `
                    -Body $paramBody `
                    -ContentType 'application/json'
            }
        }
    }
}