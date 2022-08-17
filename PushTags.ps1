# Determine Version and Do A Git Push w/ Tags
param (
	[Parameter(Mandatory=$true)]
	[string]$CommitMessage = (Read-Host "Enter the commit message")
)

$addonName = Split-Path $PSScriptRoot -Leaf
$tocFile = "{0}\{1}.toc" -f ($PSScriptRoot, $addonName)

if (Test-Path -Path $tocFile) {
    $contents = Get-Content -Path $tocFile

    # determine the version line
    for ($i = 0; $i -lt $contents.Count; $i++) {
        if ($contents[$i] -match "Version") {
            break;
        }
    }
    # .*_(\d+(\.\d+){1,3})
    if ($contents[$i] -match "## Version: (\d+\.\d+\.\d+)") {
		git add .
		git commit -a -m $CommitMessage
		git push origin master
        git tag -a $Matches[1] -m ("{0} Release" -f $Matches[1])
        git push origin --tags
    }
    else {
        Write-Host "Unable to determine addon version."
    }
}
else {
    Write-Host "Failed to determine TOC file."
}