enum IntervalUnits 
{
    Minutes
    Hours
    Days
}
function Install-Heartbeat {
    # Creates a new heartbeat 
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name."
        )]
        [String]$Name, 
        [String]$Description,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy an interval for the Heartbeat."
        )]
        [int32]$Interval,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a unit of measure for the Heartbeat Interval (Minutes, Hours, Days)."
        )]
        [IntervalUnits]$IntervalUnit,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy if the Heartbeat is enabled or disabled when created."
        )]
        [Switch]$Enabled,
        [String]$OwnerTeam,
        [String]$AlertMessage,
        [String]$AlertTags,
        [Int32]$AlertPriority 
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Convert Bodu Vars to JSON
        # No validation on the passed data is required as that is handled in the above param
        $body = @{
            name=$Name
            description=$Description
            interval=$Interval
            intervalUnit=$IntervalUnit
            enabled=$Enabled
            ownerTeam=$OwnerTeam
            alertTags=$AlertTags
            alertPriority=$AlertPriority
        }
        # Set Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats"
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Post -URI $uri -Headers $RequestHeaders -Body (ConvertTo-JSON $body)
    } catch {
        Write-Error "Error completing the request: $_"
    }
}

Function Get-Heartbeats {
    # Lists all Heartbeats
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats"
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Get -URI $uri -Headers $RequestHeaders
    } catch {
        Write-Error "Error completing the request: $_"
    }
}
Function Get-Heartbeat {
    # Lists specified Heatbeat
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name to search for."
        )]
        [String]$heartbeatName,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats/$heartbeatName"
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Get -URI $uri -Headers $RequestHeaders
    } catch {
        Write-Error "Error completing the request: $_"
    }
}

Function Ping-Heartbeat {
    # Pings specified Heartbeat
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name."
        )]
        [String]$heartbeatName,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats/$heartbeatName/ping"
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method POST -Uri $uri -Headers $RequestHeaders
    } catch {
        Write-Error "Error completing the request: $_"
    }
}

Function Update-Heartbeat {
    param (
        # Inline Params
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name."
        )]
        [String]$heartbeatName,
        # Body Fields
        [String]$heartbeatDescription,
        [Int32]$Interval,
        [IntervalUnits]$IntervalUnit,
        [Switch]$Enabled,
        [String]$OwnerTeam,
        [String]$AlertMessage,
        [String]$alertTags,
        [Int32]$alertPriority

    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats/$heartbeatName"
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Convert Vars to JSON
        $body = @{
            description=$heartbeatDescription
            interval=$Interval
            intervalUnit=$IntervalUnit
            enabled=$Enabled
            ownerTeam=$OwnerTeam
            alertMessage=$AlertMessage
            alertTags=$alertTags
            alertPriority=$alertPriority
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Patch -Uri $uri -Headers $RequestHeaders -Body (ConvertTo-JSON $body)
    } catch {
        Write-Error "Error completing the request: $_"
    }
}

Function Enable-Heartbeat {
    # Enables specified Heartbeat 
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name."
        )]
        [String]$heartbeatName
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats/$heartbeatName/enable"
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Post -Uri $uri -Headers $RequestHeaders
    } catch {
        Write-Error "Error completing the request: $_"
    }
}

Function Disable-Heartbeat {
    # Disables specified Heartbeat
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name."
        )]
        [String]$heartbeatName
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats/$heartbeatName/disable"
        # Request Headers
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Post -Uri $uri -Headers $RequestHeaders
    }
    catch {
        Write-Error "Error completing the request: $_"
    }
}

Function Remove-Heartbeat {
    # Removes the specified Heartbeat from OpsGenie
    param (
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must provide a GenieKey for the requests to be authroised."
        )]
        [String]$GenieKey,
        [parameter(
            Mandatory=$true, 
            HelpMessage="You must specifiy a Heartbeat name."
        )]
        [String]$heartbeatName
    )
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    try {
        # Target URI
        $uri = "https://api.opsgenie.com/v2/heartbeats/$heartbeatName"
        # Request Headers 
        $RequestHeaders = @{
            Authorization="GenieKey $GenieKey"
        }
        # Call Rest Request
        Invoke-RestMethod -ErrorAction Stop -Method Delete -Uri $uri -Headers $RequestHeaders
    }
    catch {
        Write-Error "Error completing the request: $_"
    }
}

Export-ModuleMember -Function * -Alias *