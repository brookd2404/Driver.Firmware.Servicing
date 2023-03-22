task generate_gitrelease_notes{
    . Set-SamplerTaskVariable
    $ManifestData = Import-PowerShellDataFile -Path $BuiltModuleManifest
    $ManifestData.PrivateData.PSData.ReleaseNotes >> "$OutputDirectory/releasenotes.txt"
}

task copy_module_items {
    . Set-SamplerTaskVariable
    Copy-Item -path "$OutputDirectory/CHANGELOG.md" -Destination $env:GITHUB_WORKSPACE -force
    IF(Test-Path "$env:GITHUB_WORKSPACE/docs") {
        Remove-Item -Recurse -Path "$env:GITHUB_WORKSPACE/docs" -force
    }
    #Copy Docs
    Copy-Item -path "$OutputDirectory/docs" -Destination $env:GITHUB_WORKSPACE -Recurse
    #Update Build Manifest
    Copy-Item -Path $BuiltModuleManifest -Destination $env:GITHUB_WORKSPACE -force
}

task SetGitHubActionEnvironmentVariables {
    "GH_PROJECTNAME=$(($env:GITHUB_REPOSITORY -split '/')[1])" >> $env:GITHUB_ENV
}

task zip_module_release {
    . Set-SamplerTaskVariable
    $zipFile = Join-Path -Path $OutputDirectory -ChildPath "$($ProjectName)_$($ModuleVersion).zip"
    Write-Host -Object "Zipping release to $zipFile" -ForegroundColor DarkGray
    Compress-Archive -Path $BuiltModuleBase -DestinationPath $zipFile -Force
}