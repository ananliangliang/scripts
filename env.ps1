$target = "User"
# $target = "Machine"
# TODO 获取环境变量是是转义后的 例 %JAVA_HOME%\bin -> D:\jdk\bin

[environment]::SetEnvironmentvariable("JAVA_HOME", "D:\jdk", $target)
$jdk = "%JAVA_HOME%\bin"
$node = "D:\node"
$python = "D:\python"
$devPaths = ($jdk, $node, $python)


$path = [environment]::GetEnvironmentvariable("Path", $target)
foreach ($devPath in $devPaths) {
    if (-not $path.Contains($devPath)) {
        if ($path.EndsWith(";")) {
            $path += $devPath
        }
        else {
            $path += ";" + $devPath
        }
    }
}
[environment]::SetEnvironmentvariable("Path", $path, $target)
