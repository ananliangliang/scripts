# change Java version function
function Set-JavaVersion {
    param (
        [ValidateSet(8, 11, 17)]
        [int]$JavaVersion = 11
    )

    $env:JAVA_HOME = "D:\jdk$JavaVersion"
    $env:Path = "$env:JAVA_HOME\bin;$env:Path"
    Write-Output "Java $JavaVersion activated temporarily"
    if ($JavaVersion -eq 8) {
        java -version
    }
    else {
        java --version        
    }
}

New-Alias sjv Set-JavaVersion

# reset Navicat trial
function Remove-NavicatTrial {

    Remove-Item HKCU:\Software\PremiumSoft\NavicatPremium\Update\
    Remove-Item HKCU:\Software\PremiumSoft\NavicatPremium\Registration16XEN\

    $NavicatInfoParentPath = "HKCU:\Software\Classes\CLSID\"
    foreach ($item in Get-ChildItem $NavicatInfoParentPath -Name) {
        if (Test-Path "$NavicatInfoParentPath\${item}\Info") {
            Remove-Item -Recurse "$NavicatInfoParentPath\${item}"
        }
    }


}

New-Alias rnt Remove-NavicatTrial


Export-ModuleMember -Function * -Alias *
