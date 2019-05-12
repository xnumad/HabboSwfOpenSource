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
                $paths[] = $dir . DIRECTORY_SEPARATOR . $value;
            }
        }
    }
}
dirToArray("src");

$tmp = "";
$deleteFile = array();
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

    $dataBin = file_get_contents($pathDir.'/'.$sourceName);
    $dataBin = str_replace("\r", "\n", $dataBin);
    $InitLign = explode("\n", $dataBin)[0];
    if(strpos($InitLign, "<?xml ") === FALSE)
        continue; 
    
    $firstLign = explode("\n", $dataBin)[1];
    if(strpos($firstLign, "<layout name=\"") === FALSE && strpos($firstLign, "<skin name=\"") === FALSE)
        continue;

    $nameTemplate = "";
    if (strpos($firstLign, "<layout name=\"") !== false) {
        $nameTemplate = explode('"', explode("<layout name=\"", $firstLign)[1])[0]."_xml";
    }
    if (strpos($firstLign, "<skin name=\"") !== false) {
        $nameTemplate = explode('"', explode("<skin name=\"", $firstLign)[1])[0]."_xml";
    }

    $tmp .= $path.": ".$pathDir.'/'.$sourceName.": ". $pathDir.'/'.$nameTemplate.".bin\n";
    continue;

    $deleteFile[] = $pathDir.'/'.$sourceName;
    copy($pathDir.'/'.$sourceName, $pathDir.'/'.$nameTemplate.".bin");

    $data = str_replace('source="'.$sourceName, 'source="'.$nameTemplate.".bin", $data);
    file_put_contents($path, $data);


}

foreach($deleteFile as $file) {
    unlink($file);
}

file_put_contents("tmp.txt", $tmp);

function getTypeDir($sourceExt) {
    if ($sourceExt == 'png')
        return "/images";
    else if($sourceExt == 'mp3')
        return "/sounds";
    else if($sourceExt == 'bin')
        return "/binaryData";
}