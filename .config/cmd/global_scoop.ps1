$scoopPath="C:\ProgramData\scoop"
$env:SCOOP_GLOBAL=$scoopPath
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
$env:SCOOP=$scoopPath;[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'MACHINE')
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
$Reg='Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment'
$OldPath=(Get-ItemProperty -Path $Reg -Name PATH).Path;$NewPath=$OldPath+';'+$scoopPath+'\shims'
Set-ItemProperty -Path $Reg -Name PATH -Value $NewPath
$CurrentValue=[Environment]::GetEnvironmentVariable('PSModulePath','Machine')
[Environment]::SetEnvironmentVariable('PSModulePath', $CurrentValue + ';'+$scoopPath+'\modules', 'Machine')
