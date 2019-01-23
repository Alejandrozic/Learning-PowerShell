<#
  Bundle of PowerShell commands for my memory
#>


######################
# Installed Programs #
# Returns array      #
######################
$installed_programs = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName
foreach($program in $installed_programs){
  if ($program.DisplayName -Match 'WhatIAmLookingFor' ){
      # [...]
  }
}

############################
# Check for .NET framework #
############################
# Ref: https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed
# 379893 = .NET Framework 4.5.2

$dotnet_ver = (Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release
if ($dotnet_ver -lt 379893){
  # [...]
}

#####################
#  Check PowerShell #
#  V3 +             #
#####################
if ((Get-Host).Version.Major -lt 3){
  # [...]
}

#####################
#  Telnet           #
#  Test TCP Ports   #
#####################
if  ((Test-NetConnection -ComputerName 'somedevicename' -Port 443).TcpTestSucceeded){
  # [...]
}

#######################
# Exception Handling  #
#######################
Trap{
    Write-Host "ERROR: $_"
    Exit 1
}
Throw "error description/details"

