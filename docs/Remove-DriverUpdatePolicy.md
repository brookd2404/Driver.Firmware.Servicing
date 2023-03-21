---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Remove-DriverUpdatePolicy

## SYNOPSIS
Deletes a Driver Update Policy for Windows Updates for Business.

## SYNTAX

```
Remove-DriverUpdatePolicy [-policyID] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function will delete a Driver Update Policy for Windows Updates for Business.

## EXAMPLES

### EXAMPLE 1
```
Remove-DriverUpdatePolicy -policyID 00000000-0000-0000-0000-000000000000
```

## PARAMETERS

### -policyID
The Update Policy ID to delete.

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

### System.String
## NOTES

## RELATED LINKS
