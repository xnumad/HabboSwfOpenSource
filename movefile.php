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

    if (strpos($data, '[Embed(') === false)
        continue;

    $sourceName = "";
    if (strpos($data, 'source="') !== false) {
        $sourceName = explode('"', explode('source="', $data)[1])[0];
    }

    if ($sourceName == "")
        continue;

    $sourceExt = explode('.', $sourceName)[1];
    if ($sourceExt == "ttf") {
        continue;
    }
    
    $nameFile = explode('.', $file)[0];
    $dirType = getTypeDir($sourceExt);

    rename($path, $pathDir.$dirType.'/'.$file);
}

//file_put_contents("tmp.txt", $tmp);

function getTypeDir($sourceExt) {
    if ($sourceExt == 'png')
        return "/images";
    else if($sourceExt == 'mp3')
        return "/sounds";
    else if($sourceExt == 'bin')
        return "/binaryData";
}