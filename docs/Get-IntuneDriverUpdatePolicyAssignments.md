---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Get-IntuneDriverUpdatePolicyAssignments

## SYNOPSIS
This function gets the assignments for a Driver Policy within Intune

## SYNTAX

```
Get-IntuneDriverUpdatePolicyAssignments [-policyID] <String> [<CommonParameters>]
```

## DESCRIPTION
This function gets the assignments for a Driver Policy within Intune

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -policyID
The policy ID to get the assignments for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This has only been tested for the commercial driver and firmware updates.
https://learn.microsoft.com/en-us/graph/api/adminwindowsupdates-list-updatepolicies?view=graph-rest-beta&tabs=http

You can get the group ID by using (Get-IntuneDriverUpdatePolicyAssignments -policyID \<PolicyID\>).id.split('_') | Where-Object {$_ -ne "\<PolicyID"}

## RELATED LINKS
