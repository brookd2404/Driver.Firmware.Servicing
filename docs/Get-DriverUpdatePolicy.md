---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Get-DriverUpdatePolicy

## SYNOPSIS
This function gets all update  policies for Windows Updates for Business for Driver and Firmware Servicing.

## SYNTAX

```
Get-DriverUpdatePolicy [[-policyID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function gets all update  policies for Windows Updates for Business for Driver and Firmware Servicing.

## EXAMPLES

### EXAMPLE 1
```
Get-DriverUpdatePolicy
```

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This has only been tested for the commercial driver and firmware updates.
https://learn.microsoft.com/en-us/graph/api/adminwindowsupdates-list-updatepolicies?view=graph-rest-beta&tabs=http

## RELATED LINKS
