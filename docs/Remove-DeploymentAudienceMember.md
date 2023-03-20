---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Remove-DeploymentAudienceMember

## SYNOPSIS
Remove members from a deployment audience for Windows Updates for Business

## SYNTAX

```
Remove-DeploymentAudienceMember [-azureDeviceIDs] <Array> [-policyID] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function will check if the deployments audiences have the devices as members, and if so they will be removed from the audience.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -azureDeviceIDs
The Azure Device IDs to add to the audience.

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

### -policyID
The Update Policy ID to get the audience from.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
