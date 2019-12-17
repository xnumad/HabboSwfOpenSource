<?php 
exec('C:\Users\Wibbo\Downloads\flex_sdk_4.6\bin\mxmlc.exe "' . __DIR__ . '\src\Habbo.as" -static-link-runtime-shared-libraries=true -swf-version=14 -default-background-color=#000000 -use-network=true -default-frame-rate 40 -default-size 1280 800');

$totalTime = (time() + explode(' ', microtime())[0]) - $_SERVER["REQUEST_TIME_FLOAT"];
$milleSecond = substr(explode('.', $totalTime * 1000)[1], 0, 9);

if(file_exists(__DIR__ . '\src\Habbo.swf')) rename(__DIR__ . '\src\Habbo.swf', __DIR__ . '\PRODUCTION-'.date("YmdHi").'-'.$milleSecond.'.swf');

echo "Completed ! " . date("i:s", $totalTime) . " 0." . substr(explode('.', $totalTime)[1], 0, 9);