﻿Function Start-FilePicker{

<#
    .SYNOPSIS
    Lets the user select a folder and returns the path.

    .DESCRIPTION
    Lets the user select a folder and returns the path.

    .PARAMETER description
    Specifies the description dialog which is shown to the user

    .EXAMPLE
    Start-FilePicker -description "Select a file or directory"

#>

param(
    [string]$description = "Select a file or directory"
)

    $browse = New-Object System.Windows.Forms.FolderBrowserDialog
    $browse.SelectedPath = "$ENV:UserProfile\Downloads"
    $browse.Description = $description

    $show = $browse.ShowDialog()

    if ($show -eq "OK") {
        $test = $browse.SelectedPath | Out-String
        $test = $test -replace "`n|`r"
        return $test
    }
}