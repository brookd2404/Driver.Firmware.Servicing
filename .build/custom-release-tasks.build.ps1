task Copy-GitReleaseNotes {
    . Set-SamplerTaskVariable
    $ManifestData = Import-PowerShellDataFile -Path $BuiltModuleManifest
    $ManifestData.PrivateData.PSData.ReleaseNotes >> "$OutputDirectory/releasenotes.txt"
}

task Copy-ModuleItems {
    . Set-SamplerTaskVariable
    Copy-Item -path "$OutputDirectory\CHANGELOG.md" -Destination $SourcePath -force
    IF(Test-Path "$SourcePath\docs") {
        Remove-Item -Recurse -Path "$SourcePath\docs" -force
    }
    #Copy Docs
    Copy-Item -path "$OutputDirectory\docs" -Destination $SourcePath -Recurse
    #Update Build Manifest
    Copy-Item -Path $BuiltModuleManifest -Destination $SourcePath -force -passThru
}

task SetGitHubActionEnvironmentVariables {
    "GH_PROJECTNAME=$(($env:GITHUB_REPOSITORY -split '/')[1])" >> $env:GITHUB_ENV
}

task zip_module_release {
    $zipFile = Join-Path -Path $OutputDirectory -ChildPath "$($ProjectName)_$($ModuleVersion).zip"

    Write-Host -Object "Zipping release to $zipFile" -ForegroundColor DarkGray

    Compress-Archive -Path $BuiltModuleBase -DestinationPath $zipFile -Force
}