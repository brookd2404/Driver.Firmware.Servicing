---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Get-DriverUpdateDeploymentAudience

## SYNOPSIS
This function get Update Deployment Audiences.

## SYNTAX

```
Get-DriverUpdateDeploymentAudience [[-audienceID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function get Update Deployment Audiences.

## EXAMPLES

### EXAMPLE 1
```
Get-DriverUpdateDeploymentAudience
```

Get-DriverUpdateDeploymentAudience -audienceID \<audienceID\>

## PARAMETERS

### -audienceID
The audience ID to get the deployment audience for.

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

## RELATED LINKS
