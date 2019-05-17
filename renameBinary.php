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
                $paths[] = $dir . DIRECTORY_SEPARATOR . $value;
            }
        }
    }
}
dirToArray("src");

$tmp = "";
$deleteFile = array();
$doublons = array();
foreach ($paths as $path) {
    $parts = explode('\\', $path);
    $file = array_pop($parts);
    $pathDir = implode('/', $parts);
    if (strpos($file, ".") === false)
        continue;

    $ext = explode('.', $file)[1];
    if ($ext !== "as")
        continue;

    $data = file_get_contents($path);

    if (strpos($data, 'extends ByteArrayAsset') === false)
        continue;

    if (strpos($data, '[Embed(') === false)
        continue;

    $sourceName = "";
    if (strpos($data, 'source="') !== false) {
        $sourceName = explode('"', explode('source="', $data)[1])[0];
    }

    if ($sourceName == "")
        continue;
    if(strpos($sourceName, "_Str_") === FALSE)
        continue;

    $sourceExt = explode('.', $sourceName)[1];
    if ($sourceExt != "bin") {
        continue;
    }
    
    $nameFile = explode('.', $file)[0];

    $nameTemplate = "";

    $nameTemplate = researchClassName($nameFile);

    if (array_key_exists($nameTemplate, $doublons)) {
        $doublons[$nameTemplate]++;
    }
     else {
         $doublons[$nameTemplate] = 1;
     }

     if($nameTemplate == "")
        continue;

    $tmp .= $path.": ".$pathDir.'/'.$sourceName.": ". $pathDir.'/'.$nameTemplate.".bin\n";

    $deleteFile[] = $pathDir.'/'.$sourceName;
    copy($pathDir.'/'.$sourceName, $pathDir.'/'.$nameTemplate.".bin");

    $data = str_replace('source="'.$sourceName, 'source="'.$nameTemplate.".bin", $data);
    file_put_contents($path, $data);
}
asort($doublons);

file_put_contents("tmp2.txt", print_r($doublons, true));


foreach($deleteFile as $file) {
    unlink($file);
}

file_put_contents("tmp.txt", $tmp);

function researchClassName($oldClassName) {
    global $paths;
    foreach ($paths as $path) {
        $parts = explode('\\', $path);
        $file = array_pop($parts);
        if (strpos($file, ".") === false) {
            continue;
        }
    
        $ext = explode('.', $file)[1];
        if ($ext !== "as") {
            continue;
        }
    
        $data = file_get_contents($path);
    
        if (strpos($data, ":Class = ".$oldClassName.";") === false) {
            continue;
        }

        $class = explode('.', $file)[0];
        $newClassName = explode(" ", explode(":Class = ".$oldClassName.";", $data)[0]);
        $newClassName = $newClassName[count($newClassName) - 1];

        return $class."_".$newClassName;
    }
}

function getTypeDir($sourceExt) {
    if ($sourceExt == 'png')
        return "/images";
    else if($sourceExt == 'mp3')
        return "/sounds";
    else if($sourceExt == 'bin')
        return "/binaryData";
}