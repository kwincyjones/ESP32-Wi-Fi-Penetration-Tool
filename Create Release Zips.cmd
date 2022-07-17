SETLOCAL EnableDelayedExpansion
:: This script must be ran from the Release Folder
for /d %%d in (*.*) do (
    set test=%%d
    echo Creating New Archives...
	powershell -NoLogo -NoProfile -Command Compress-Archive !test! -DestinationPath !test!
)
pause