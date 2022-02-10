# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# THIS CODE AND ANY ASSOCIATED INFORMATION ARE PROVIDED “AS IS” WITHOUT
# WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THE ENTIRE RISK OF USE, INABILITY TO USE, OR 
# RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# AUTHOR: Mihai Filip
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# Dependencies: WinOS
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# USAGE: 
# .\tms-ProfileManager.ps1 (or EXE)
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 

# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# FUNCTIONS
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
Function New-CustomProfile {
  # credit for code in this function: https://gist.github.com/DanielSmon/cc3fa072857f0272257a5fd451768c3a
  param (
    [string]$pName
  )

  $PN = $pName
  Write-Output "Launching $PN Teams Profile ..."

  $userProfile = $env:USERPROFILE
  $appDataPath = $env:LOCALAPPDATA
  $customProfile = "$appDataPath\Microsoft\Teams\CustomProfiles\$PN"
  $downloadPath = Join-Path $customProfile "Downloads"

  if (!(Test-Path -PathType Container $downloadPath)) {
    New-Item $downloadPath -ItemType Directory |
      Select-Object -ExpandProperty FullName
  }

  $env:USERPROFILE = $customProfile
  Start-Process `
    -FilePath "$appDataPath\Microsoft\Teams\Update.exe" `
    -ArgumentList '--processStart "Teams.exe"' `
    -WorkingDirectory "$appDataPath\Microsoft\Teams"

}

Function Get-CustomProfiles {
  $profiles = gci -path "$($env:localappdata)\Microsoft\Teams\CustomProfiles"

  return $profiles
}

# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# ICON
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
$tmsIconBase64 = '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7P//8vH/+ejn/+vBvf/+zsr//9jU/9+jn/+mRT3/uFRL/b1VTP+5U0veDQYFCTUYFgB7NzIBezgyATkbGAARCAcJuVNL3rxWTv+pRDz9w4F8///08v/95uT///X0/+eyrv/SgXv///b1//3n5f//7Or/8t/e/9THxv/w4eD//O3s///y8f/56Of/68G9//7Oyv//2dX/4aKe/6lGP/+6VUz9vlZN/7lUS94OBgYJNRgWAHs4MgF8ODIBOhsYABEJBwm5VEzevVdP/6pFPf3Dg37///f2//3q6P//9vX/6Lez/9WKhP//9/b//evp///w7v/y4uH/08bF/+/g3//77Ov///Hw//jn5v/rwLz//s3J///Y1P/jo5//r0lB/7xWTv2/Vk7/ulRM3g4GBgk2GBYAfDgyAXw4MwE6GxgAEQgHCbpUTN6+WFD/rEY+/cWFgP//+/r//ezr///////pxMH/1ZCL///////+8O7///Py//Pm5P/Wy8r/8uXk//3w7///9vX/+ezr/+7Ewf//0c3//9vX/+WopP+zTEP/vldP/cBXT/+7VU3eDgYGCTYYFgB8ODMBfDkzATkbGAARCAcJu1VN3r9ZUf+wSD/9yYiD///9/f//9PP/7srH/9SJg//JbWb/6Lq2//vq6f//+fj/8ubl/9K/vv/r19b/9N/e//jj4v/y2df/6bm1//fEv//8zMj/3JSP/7dORv/AWFD9wVhQ/7tWTd4OBgYJNhkWAHw5MwF9OTQBOBsYABAICAm7Vk7ewFpS/7VKQv3Oi4b///7+//739v/nu7f/36ai/+Guqv/fqKT/+erp///////o09H/jkM9/5RDPf+jUEn/qFRN/6BKQ/+hTEb/oUtE/6xSS/+2U0v/vFZO/8BYUP3CWVH/vFZO3g8HBgk2GRYAfTk0AX06NAE3GhgAEAgICbxXT97CW1P/uUxE/dKQiv///////v39/////////////////////////v7///////bv7v/dxMP/zKCd/59KQ/+fQjv/v3Nt//G8uP/hpaD/sVVO/7ZTSv++WFD/wVlR/cNaUv+8V0/eDwcGCTYZFwB9OjQBfjo1ATYZFwAOBwYJvVhQ3sNbUv+/VU39xmtj/+S4tf/lurf/5Li0/+O3tP/jt7T/4bay/+C6t//27ez/+O/u//nr6v//////1KKe/6lJ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'
$tmsIcon = [Convert]::FromBase64String($tmsIconBase64)
$tmsi = New-Object IO.MemoryStream($tmsIcon, 0, $tmsIcon.Length)
$tmsi.Write($tmsIcon, 0, $tmsIcon.Length)
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
# FORM
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
<# 
.NAME
    PManager
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$TMSProfileManager               = New-Object system.Windows.Forms.Form
$TMSProfileManager.ClientSize    = New-Object System.Drawing.Point(679,355)
$TMSProfileManager.text          = "TEAMS - Profile Manager"
$TMSProfileManager.TopMost       = $false
# $TMSProfileManager.icon          = "$($HOME)\Documents\WindowsPowerShell\teams.ico"
$TMSProfileManager.icon          = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -argument $tmsi).GetHIcon())
$TMSProfileManager.BackColor     = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")
$TMSProfileManager.FormBorderStyle    = 'Fixed3D'
$TMSProfileManager.MaximizeBox        = $false
$TMSProfileManager.MinimizeBox        = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Profiles:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(10,10)
$Label1.Font                     = New-Object System.Drawing.Font('Segoe UI',10)

$listProfiles                    = New-Object system.Windows.Forms.ListBox
$listProfiles.text               = "listBox"
$listProfiles.width              = 659
$listProfiles.height             = 200
$listProfiles.location           = New-Object System.Drawing.Point(10,35)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Selected: "
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(10,255)
$Label2.Font                     = New-Object System.Drawing.Font('Segoe UI',10)

$lblSelectedProfile              = New-Object system.Windows.Forms.Label
$lblSelectedProfile.text         = "(no profile selected)"
$lblSelectedProfile.AutoSize     = $true
$lblSelectedProfile.width        = 25
$lblSelectedProfile.height       = 10
$lblSelectedProfile.location     = New-Object System.Drawing.Point(80,255)
$lblSelectedProfile.Font         = New-Object System.Drawing.Font('Segoe UI',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$btnStart                        = New-Object system.Windows.Forms.Button
$btnStart.text                   = "Start"
$btnStart.width                  = 100
$btnStart.height                 = 30
$btnStart.location               = New-Object System.Drawing.Point(346,250)
$btnStart.Font                   = New-Object System.Drawing.Font('Segoe UI',10)

$btnCache                        = New-Object system.Windows.Forms.Button
$btnCache.text                   = "Cache"
$btnCache.width                  = 100
$btnCache.height                 = 30
$btnCache.location               = New-Object System.Drawing.Point(459,250)
$btnCache.Font                   = New-Object System.Drawing.Font('Segoe UI',10)

$btnLocation                     = New-Object system.Windows.Forms.Button
$btnLocation.text                = "Location"
$btnLocation.width               = 100
$btnLocation.height              = 30
$btnLocation.location            = New-Object System.Drawing.Point(569,250)
$btnLocation.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "New profile:"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(10,325)
$Label3.Font                     = New-Object System.Drawing.Font('Segoe UI',10)

$txtNewProfile                   = New-Object system.Windows.Forms.TextBox
$txtNewProfile.multiline         = $false
$txtNewProfile.width             = 151
$txtNewProfile.height            = 20
$txtNewProfile.location          = New-Object System.Drawing.Point(94,320)
$txtNewProfile.Font              = New-Object System.Drawing.Font('Segoe UI',10)

$btnCreate                       = New-Object system.Windows.Forms.Button
$btnCreate.text                  = "Create"
$btnCreate.width                 = 100
$btnCreate.height                = 30
$btnCreate.location              = New-Object System.Drawing.Point(569,316)
$btnCreate.Font                  = New-Object System.Drawing.Font('Segoe UI',10)

$txtProfileName                  = New-Object system.Windows.Forms.TextBox
$txtProfileName.multiline        = $false
$txtProfileName.width            = 100
$txtProfileName.height           = 20
$txtProfileName.visible          = $false
$txtProfileName.location         = New-Object System.Drawing.Point(316,320)
$txtProfileName.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)


$customProfiles = Get-CustomProfiles

if ($customProfiles) {
  foreach ($cp in $customProfiles) {
    $listProfiles.Items.Add($cp.Name)
  }
} else {
  $listProfiles.Items.Add("No custom profiles found.")
}

$listProfiles.Add_SelectedIndexChanged({
  $txtProfileName.text = $listProfiles.selectedItems
  $lblSelectedProfile.text = $txtProfileName.text
})

$btnStart.Add_Click({
  $scriptPath = "$($HOME)\Documents\WindowsPowerShell\tms-CustomProfiles.ps1"

  if ($txtProfileName.Text -eq "") {
    Write-Host 'No profile selected to start.'
  } else {
    Write-Host 'Starting profile.'
    New-CustomProfile $txtProfileName.Text
  } 
})

$btnCache.Add_Click({
  $path = "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtProfileName.Text)\AppData\Roaming\Microsoft\Teams"

  if ($txtProfileName.Text -eq "") {
    Write-Host 'No profile selected to clear cache.'
  } else {
    gci -path $path | foreach { Remove-Item $_.FullName -Recurse -Force }
    Write-Host 'Cache cleared successfully.'
  } 
})

$btnLocation.Add_Click({
  if ($txtProfileName.Text -eq "") {
    Write-Host 'No profile selected to open location.'
  } else {
    Invoke-Item "$($env:localappdata)\Microsoft\Teams\CustomProfiles\$($txtProfileName.Text)"
    Write-Host 'Location opened successfully.'
  }
})

$btnCreate.Add_Click({
  $scriptPath = "$($HOME)\Documents\WindowsPowerShell\tms-CustomProfiles.ps1"
  $profileName = $txtNewProfile.Text

  if ($profileName -eq "") {
    Write-Host 'No profile name to create profile.'
  } else {
    write-host 'New profile created successfully'
    $listProfiles.Items.Add($profileName)
    New-CustomProfile $profileName
  }
})

$TMSProfileManager.controls.AddRange(@($Label1,$listProfiles,$Label2,$lblSelectedProfile,$btnStart,$btnCache,$btnLocation,$Label3,$txtNewProfile,$btnCreate,$txtProfileName))
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 
#region Logic 

#endregion

[void]$TMSProfileManager.ShowDialog()
# ...- --- .. -.. - .... . ...- .. .-.. .-.. .- .. -. 