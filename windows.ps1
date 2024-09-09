Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install packages.config -y
move wallpaper.jpg %USERPROFILE%/Pictures
irm https://christitus.com/win | iex
wget -r -l 1 --span-hosts --accept-regex=.*bmrf.org/repos/tron//.*.exe -erobots=off -nH https://bmrf.org/repos/tron/
irm https://get.activated.win | iex
