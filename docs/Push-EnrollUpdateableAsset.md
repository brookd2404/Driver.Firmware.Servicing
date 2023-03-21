---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Push-EnrollUpdateableAsset

## SYNOPSIS
This script is to be used to push enrol assets as without it, the delay could be significant.

## SYNTAX

```
Push-EnrollUpdateableAsset [-azureDeviceIDs] <Array> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This script is to be used to push enrol assets as without it, the delay could be significant.

## EXAMPLES

### EXAMPLE 1
```
Push-EnrollUpdateableAsset -azureDeviceIDs ('ID1','ID2')
```

## PARAMETERS

### -azureDeviceIDs
The Azure AD Device IDs to enroll as updateable assets.

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
This script is to be used to push enrol assets as without it, the delay could be significant.
This is also a reccoemnded step in the documentation from Microsoft.

## RELATED LINKS
