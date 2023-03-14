---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Add-DriverUpdatePolicyAudienceMember

## SYNOPSIS
Add members to a deployment audience for Windows Updates for Business

## SYNTAX

```
Add-DriverUpdatePolicyAudienceMember [-azureDeviceIDs] <Array> [-updateAudienceID] <String>
 [<CommonParameters>]
```

## DESCRIPTION
This function will check if the deployments audiences have the devices as members, and if not they will be added to the audience.

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

### -updateAudienceID
The Update Audience ID to add the members to.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
