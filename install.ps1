# Module Name
$ModuleName = "ConvertCalendar"

# Module Path
if(($PSVersionTable.Platform -eq "Win32NT") -or ($PSVersionTable.Platform -eq $null){
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"
else{
Join-Path ($HOME) "/.local/share/powershell/Modules"}
$NewPath = Join-Path $ModulePath $ModuleName

# Make Directory
if( -not (Test-Path $NewPath)){
	md $NewPath
}

# Copy Module
$ModuleFileName = Join-Path $PSScriptRoot ($ModuleName + ".psm1")
Copy-Item $ModuleFileName $NewPath
