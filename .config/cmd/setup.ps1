Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# TODO Handle Admin user check
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# Install the absolute essentials
scoop install $(gc ~/.config/cmd/packages.txt)

# Apply config patches
xcopy %USERPROFILE%\.config\cmd\patch %USERPROFILE% /E