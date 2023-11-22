---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# New-IntuneDriverUpdatePolicyAssignment

## SYNOPSIS
This function is to be used to add groups to a Driver Policy within Intune

## SYNTAX

```
New-IntuneDriverUpdatePolicyAssignment [-assignmentGroupIDs] <Array> [-policyID] <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
This function is to be used to add groups to a Driver Policy within Intune

## EXAMPLES

### EXAMPLE 1
```
','<Groupid2>' -policyID $policyID
```

## PARAMETERS

### -assignmentGroupIDs
The Entra ID Object ID of the group to add to the policy

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
The ID of the policy to update

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
