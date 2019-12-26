# Opsgenie PowerShell Module

## OpsGenie-Heartbeat
All the functions listed below are sending HTTPS requests to OpsGenie via the `Invoke-RestMethod` cmdlet. Learn more about the [Invoke-RestMethod](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-restmethod?view=powershell-6#description).
Alls responses are returned in the form of an Object.

### Get-Heartbeat
List information regarding the specified Heartbeat
#### Usage 
```
Get-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-heartbeatName <Target OpsGenie Heartbeat>]
```
#### Parameter Details


### Get-Heartbeats
Lists all available Heartbeats
#### Usage
```
Get-Heartbeats
    [-GenieKey <OpsGenie Authorization Key>]
```

### Ping-Heartbeat
Resets a Heartbeat
#### Usage
```
Ping-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-heartbeatName <Target OpsGenie Heartbeat>]
```
### Install-Heartbeat
Creates a new Heartbeat.
Mandatory fields:
- heartbeatName
- Interval
- Interval Unit
#### Usage
```
Install-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-Name <Heartbeat Name (String)>]
    [-Description <Heartbeat Description (String)>]
    [-Interval <Heartbeat Interval Integer>]
    [-IntervalUnit <Heartbeat Interval Unit>]
    [-Enabled <Heartbeat Enabled / Disabled (Boolean)>]
    [-OwnerTeam <Owner team of the heartbeat, consisting id and/or name of the owner team>]
    [-AlertMessage <Specifies the alert message for heartbeat expiration alert. If this is not provided, default alert message is "HeartbeatName is expired". This has a limit of 130 chars, specified by OpsGenie API>]
```

### Update-Heartbeat
Updates existing heartbeat.
#### Usage
```
Update-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-heartbeatName <Heartbeat Name>]
    [-Description <Heartbeat Description (String)>]
    [-Interval <Heartbeat Interval Integer>]
    [-IntervalUnit <Heartbeat Interval Unit>]
    [-Enabled <Heartbeat Enabled / Disabled (Boolean)>]
    [-OwnerTeam <Owner team of the heartbeat, consisting id and/or name of the owner team>]
    [-AlertMessage <Specifies the alert message for heartbeat expiration alert. If this is not provided, default alert message is "HeartbeatName is expired". This has a limit of 130 chars, specified by OpsGenie API>]
```

### Remove-Heartbeat
Removes an existing Heartbeat.

#### Usage
```
Remove-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-heartbeatName <Target Heartbeat to remove>]
```

### Enable-Heartbeat
Enables a disabled Heartbeat.

#### Usage
```
Enable-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-heartbeatName <Tartget Heartbeat to enable>]
```
### Disable-Heartbeat 
Disables an enabled Heartbeat.

#### Usage
```
Disable-Heartbeat
    [-GenieKey <OpsGenie Authorization Key>]
    [-heartbeatName <Target Heartbeat to disable>]
```
### Heartbeats
This module supports all API endpoints provided by the [OpsGenie Heartbeat API](https://docs.opsgenie.com/docs/heartbeat-api)


### Alerts
There is currently no integration for OpsGenie Alerts

## TODO
- Add character limits to parameters if API specifies
- Consistency of parameter names
- Add logic for enabling - disabling heartbeats
