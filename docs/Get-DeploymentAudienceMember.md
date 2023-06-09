---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Get-DeploymentAudienceMember

## SYNOPSIS
This function will get the members of a deployment audience for Windows Updates for Business.

## SYNTAX

```
Get-DeploymentAudienceMember [[-policyID] <String>] [[-audienceID] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function will get the members of a deployment audience for Windows Updates for Business.

## EXAMPLES

### EXAMPLE 1
```

```

## PARAMETERS

### -audienceID
The audience ID to get the members for.

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

### -policyID
The policy ID to get the members for.

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
You can specify either the audienceID or policyID parameter, if both are specified the audienceID will be used.

## RELATED LINKS
