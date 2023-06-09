---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Revoke-DriverUpdateApproval

## SYNOPSIS
Revoke a driver update approval from a policy for Windows Updates for Business.

## SYNTAX

```
Revoke-DriverUpdateApproval -policyIDs <Array> -catalogEntryID <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function will revoke a driver update approval from a policy for Windows Updates for Business.

This function will find the compliance change ID for the update and revoke it based on the catalogEntry ID.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -catalogEntryID
The update catalog entry ID.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -policyIDs
The policy IDs to revoke the approval from.

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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

### System.Array
## NOTES

## RELATED LINKS
