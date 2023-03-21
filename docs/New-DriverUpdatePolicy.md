---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# New-DriverUpdatePolicy

## SYNOPSIS
This function is to be used to create a Driver Policy for WUfBDS

## SYNTAX

```
New-DriverUpdatePolicy [-audienceID] <String> [-policyType] <String> [[-deferralTime] <String>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Based on the inputs, will depend on the policy creation type of Manual or Automatic.

## EXAMPLES

### EXAMPLE 1
```
New-DriverUpdatePolicy -audienceID $daAudience.id -policyType Automatic -deferralTime PT1D
```

## PARAMETERS

### -audienceID
The Deployment Audience ID.
This can be obtained from the Get-DeploymentAudience function.

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

### -deferralTime
The deferral time for the policy.
This is only required for Automatic policies.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: PT0S
Accept pipeline input: False
Accept wildcard characters: False
```

### -policyType
The type of policy to create.
Manual or Automatic.

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

## RELATED LINKS
