---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Add-DriverUpdateApproval

## SYNOPSIS
Add a driver update approval to a policy for Windows Updates for Business.

## SYNTAX

```
Add-DriverUpdateApproval [-policyIDs] <Array> [-catalogEntryID] <String> [[-deferDays] <Int32>]
 [<CommonParameters>]
```

## DESCRIPTION
This function will add a driver update approval to a policy for Windows Updates for Business.
Note: The catalog entry must be applicable to the policy, this will be checked before adding the approval.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -policyIDs
The policy IDs to add the approval to.

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -catalogEntryID
The catalog entry ID to add to the policy.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -deferDays
The days to defer the deployment of the driver update.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
