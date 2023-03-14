---
external help file: Driver.Firmware.Servicing-help.xml
Module Name: Driver.Firmware.Servicing
online version:
schema: 2.0.0
---

# Invoke-GetRequest

## SYNOPSIS
Performs Get Requests with Pagination.

## SYNTAX

```
Invoke-GetRequest [-Uri] <String> [-All] [<CommonParameters>]
```

## DESCRIPTION
Performs Get Requests with Pagination.
Without the logic in this function, all results would not be returned.

## EXAMPLES

### EXAMPLE 1
```
Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/me"
```

Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/me" -All

## PARAMETERS

### -Uri
The URI to perform the Get Request on.
This is a mandatory parameter.

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

### -All
This switch will determine if paginated requests will be run.
This is an optional parameter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Tested on PowerShell 5 and 7 on Windows.

## RELATED LINKS
