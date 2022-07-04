Set-ExecutionPolicy RemoteSigned -scope CurrentUser

#TODO Make this work for Administrator accounts
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# Install the absolute essentials
scoop install $(gc ~/.config/cmd/packages.txt)

# Setup clink
clink autorun set "clink inject --profile %XDG_CONFIG_HOME%\clink"
