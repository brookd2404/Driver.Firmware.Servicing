---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# New-IntuneDriverUpdatePolicy

## SYNOPSIS
This function is to be used to create a Driver Policy within your intune tenant.

## SYNTAX

```
New-IntuneDriverUpdatePolicy [-policyName] <String> [[-policyDescription] <String>] [-policyType] <String>
 [[-deferralDays] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Based on the inputs, will depend on the policy creation type of Manual or Automatic.

## EXAMPLES

### EXAMPLE 1
```
New-IntuneDriverUpdatePolicy  -policyType Automatic -deferralDays 1 -policyName "MyDriverUpdates" -policyDescription "My Graph Posted Policy"
```

## PARAMETERS

### -deferralDays
The deferral days for the policy.
This is only required for Automatic policies.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -policyDescription
The description of the policy to create.

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

### -policyName
The name of the policy to create.

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

### -policyType
The type of policy to create.
Manual or Automatic.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
