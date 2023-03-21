---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Update-DriverUpdatePatchDeferral

## SYNOPSIS
This function is to be used to update the Patch Deferral on Update Policies.

## SYNTAX

```
Update-DriverUpdatePatchDeferral [-policyID] <String> [-deferralTime] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function is to be used to update the Patch Deferral on Update Policies.

## EXAMPLES

### EXAMPLE 1
```
-deferralTime P1D
Explanation of the function or its result. You can include multiple The deferral time must be in the ISO8601 format.
```

## PARAMETERS

### -deferralTime
The deferral time must be in the ISO8601 format.

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

### -policyID
The Update Policy ID.
You can get this from the Get-DriverUpdatePolicy function.

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
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
