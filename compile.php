<?php 
exec('C:\Users\Wibbo\Downloads\flex_sdk_4.6\bin\mxmlc.exe "' . __DIR__ . '\src\Habbo.as" -static-link-runtime-shared-libraries=true -swf-version=14 -default-background-color=#000000 -use-network=true -default-frame-rate 40 -default-size 1280 800');

rename(__DIR__ . '\src\Habbo.swf', __DIR__ . '\Habbo_'.time().'.swf');

echo "Completed !";