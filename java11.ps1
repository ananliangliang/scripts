$env:JAVA_HOME="D:\jdk11"
$env:Path = $env:JAVA_HOME +"\bin;" +$env:Path
Write-Output "Java 11 activated"