---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Get-IntuneDriverUpdatePolicy

## SYNOPSIS
This function gets all update of the policies for Windows Updates for Business for Driver and Firmware Servicing from Intune.

## SYNTAX

```
Get-IntuneDriverUpdatePolicy [[-policyID] <String>] [[-PolicyName] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function gets all update of the policies for Windows Updates for Business for Driver and Firmware Servicing from Intune

## EXAMPLES

### EXAMPLE 1
```
# This will return all policies
Get-IntuneDriverUpdatePolicy -All
```

# This will return a specific policy by ID
Get-IntuneDriverUpdatePolicy -policyID \<policyID\>

# This will return all policies that are called Test
Get-IntuneDriverUpdatePolicy -PolicyName "Test"

## PARAMETERS

### -policyID
The policy ID to get.
If not specified, all policies will be returned.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyName
{{ Fill PolicyName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

## RELATED LINKS
