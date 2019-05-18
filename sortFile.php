<?php
header('Content-Type: text/html; charset=utf-8');
set_time_limit(0);

$paths = array();
function dirToArray($dir)
{
    global $paths;

    $cdir = scandir($dir);
    foreach ($cdir as $value) {
        if (!in_array($value, array(".", ".."))) {
            if (is_dir($dir . DIRECTORY_SEPARATOR . $value)) {
                dirToArray($dir . DIRECTORY_SEPARATOR . $value);
            } else {
                $ext = explode('.', $value)[1];
                if ($ext !== "as")
                    continue;
                $paths[$dir . DIRECTORY_SEPARATOR . $value] = file_get_contents($dir . DIRECTORY_SEPARATOR . $value);
            }
        }
    }
}
dirToArray("sort");

$pathsTwo = array();
function dirToArrayTwo($dir)
{
    global $pathsTwo;

    $cdir = scandir($dir);
    foreach ($cdir as $value) {
        if (!in_array($value, array(".", ".."))) {
            if (is_dir($dir . DIRECTORY_SEPARATOR . $value)) {
                dirToArrayTwo($dir . DIRECTORY_SEPARATOR . $value);
            } else {
                $ext = explode('.', $value)[1];
                if ($ext !== "as")
                    continue;
                $pathsTwo[$dir . DIRECTORY_SEPARATOR . $value] = file_get_contents($dir . DIRECTORY_SEPARATOR . $value);
            }
        }
    }
}
dirToArrayTwo("src");

$deleteFile = array();
$tmp = "";
foreach ($paths as $path => $data) {
    $parts = explode('\\', $path);
    $file = array_pop($parts);
    $dir = array_pop($parts);
    $pathDir = implode('/', $parts);
    if (strpos($file, ".") === false) {
        continue;
    }

    $fileName = $dir.'.'.explode('.', $file)[0];

    $packageName = explode("\n", explode("package ", $data)[1])[0];

    if (strpos($data, "import com.sulake.core.communication.messages.MessageEvent;") !== false) {
        $tmp .= "incoming: ".$path."\n"; //com.sulake.habbo.communication.messages.incoming


        $data = str_replace("package ".$packageName, "package com.sulake.habbo.communication.messages.incoming.".$dir, $data);
        forceFilePutContents("sort.com.sulake.habbo.communication.messages.incoming.".$fileName, $data);
        $deleteFile[] = $path;

        //searchAndReplace($fileName.";", "com.sulake.habbo.communication.messages.incoming.".$fileName.";");
    }

    if (strpos($data, "import com.sulake.core.communication.messages.IMessageComposer;") !== false) {
        $tmp .= "outgoing: ".$path."\n"; //com.sulake.habbo.communication.messages.outgoing

        $data = str_replace("package ".$packageName, "package com.sulake.habbo.communication.messages.outgoing.".$dir, $data);
        forceFilePutContents("sort.com.sulake.habbo.communication.messages.outgoing.".$fileName, $data);
        $deleteFile[] = $path;

        //import _Str_87._Str_8179;
        //searchAndReplace($fileName.";", "com.sulake.habbo.communication.messages.outgoing.".$fileName.";");
    }
}
file_put_contents("sort.txt", $tmp);

foreach($deleteFile as $file) {
    unlink($file);
}


function forceFilePutContents($dir, $contents)
{
    $parts = explode('.', $dir);

    $file = array_pop($parts).".as";
    $dir = '';
    foreach ($parts as $part) {
        $dir .= $part . "\\";
        if (!is_dir($dir)) {
            mkdir($dir);
        }
    }

    file_put_contents($dir . "\\" . $file, $contents);
}


function searchAndReplace($oldText, $newText) {
    return;
    global $pathsTwo;
    foreach($pathsTwo as $path => $data) {
        $parts = explode('\\', $path);
        $file = array_pop($parts);
        if (strpos($file, ".") === false) {
            continue;
        }

        if(strpos($data, $oldText) === FALSE)
            continue;

        //echo $path.": ".$oldText." - ".$newText."\n";
        $data = str_replace($oldText, $newText, $data);
        $pathsTwo[$path] = $data;

        file_put_contents($path, $data);
    }
}