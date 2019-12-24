# Opsgenie PowerShell Module

## Introduction

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
    [-OwnerTeam ]
```

### Update-Heartbeat

### Remove-Heartbeat

### Enable-Heartbeat

### Disable-Heartbeat 

### Heartbeats
This module supports all API endpoints provided by the [OpsGenie Heartbeat API](https://docs.opsgenie.com/docs/heartbeat-api)


### Alerts
There is currently no integration for OpsGenie Alerts

## Contact Me
- Email: 