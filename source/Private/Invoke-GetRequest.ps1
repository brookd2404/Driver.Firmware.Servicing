function Invoke-GetRequest {
    <#
    .SYNOPSIS
        Performs Get Requests with Pagination.
    .DESCRIPTION
        Performs Get Requests with Pagination. Without the logic in this function, all results would not be returned.
    .NOTES
        Tested on PowerShell 5 and 7 on Windows.
    .EXAMPLE
        Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/me"
        Invoke-GetRequest -Uri "https://graph.microsoft.com/beta/me" -All
    .PARAMETER Uri
        The URI to perform the Get Request on. This is a mandatory parameter.
    .PARAMETER All
        This switch will determine if paginated requests will be run. This is an optional parameter.
    #>
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]
        $Uri,
        # This switch will determine if paginated requests will be run
        [switch]
        $All
    )
    process {
        switch ($All) {
            true {
                $getRequestParameters = @{
                    Method = "GET"
                    URI    = $Uri
                }
                $getRequest = Invoke-MgGraphRequest @getRequestParameters -ErrorAction Stop
                $requestArray = @()
                $requestArray += IF ($getRequest.value) { $getRequest.value }else { $getRequest }
                while ($getRequest.'@odata.nextLink') {
                    $getRequest_NextLink = @{
                        Method = "GET"
                        URI    = $getRequest.'@odata.nextLink'
                    }
                    $getRequest = Invoke-MgGraphRequest @getRequest_NextLink -ErrorAction Stop
                    $requestArray += IF ($getRequest.value) { $getRequest.value }else { $getRequest }
                }
                $return = $requestArray
            }
            false {
                $getRequestParameters = @{
                    Method = "GET"
                    URI    = $Uri
                }
                $return = (Invoke-MgGraphRequest @getRequestParameters -ErrorAction Stop).value
            }
        }
    }
    end {
        return $return
    }
}