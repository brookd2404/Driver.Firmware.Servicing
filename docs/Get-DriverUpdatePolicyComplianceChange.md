---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Get-DriverUpdatePolicyComplianceChange

## SYNOPSIS
This function will get the compliance changes for an update policy for Windows Updates for Business.

## SYNTAX

```
Get-DriverUpdatePolicyComplianceChange [-policyID] <String> [[-catalogentryID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function will get the compliance changes for an update policy for Windows Updates for Business.
This include the deployment schedule for the Driver Updates if Deferrals are configured.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -policyID
The policy ID to get the applicable content for.

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

### -catalogentryID
The update catalog entry ID to get the compliance changes for.

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

## RELATED LINKS
