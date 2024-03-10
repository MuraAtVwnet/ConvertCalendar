# Module Name
$ModuleName = "ConvertCalendar"

# Module Path
$ModulePath = Join-Path (Split-Path $PROFILE -Parent) "Modules"
$NewPath = Join-Path $ModulePath $ModuleName

# Make Directory
if( -not (Test-Path $NewPath)){
	md $NewPath
}

# Copy Module
$ModuleFileName = Join-Path $PSScriptRoot ($ModuleName + ".psm1")
Copy-Item $ModuleFileName $NewPath
