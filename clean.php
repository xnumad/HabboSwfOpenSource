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
    if ($ext !== "as") continue;

    $data = file_get_contents($path);

    if (strpos($data, '[Embed(') === false) continue;

    $sourceName = "";
    if (strpos($data, 'source="') === false) continue;

    $sourceName = explode('"', explode('source="', $data)[1])[0];

    if ($sourceName == "") continue;

    $sourceExt = explode('.', $sourceName)[1];
    if ($sourceExt != "ttf") {
        continue;
    }
    
    $nameFile = explode('.', $file)[0];
    $dirType = getTypeDir($sourceExt);

    //if (!is_dir($pathDir.$dirType))
        //mkdir($pathDir.$dirType);
    
    $dataEdit = $data;
    //$dataEdit = str_replace('source="'.$sourceName, 'source="'.str_replace('/', '', $dirType).'/'.$nameFile.'.'.$sourceExt, $dataEdit);
    //$dataEdit = str_replace('source="'.$sourceName, 'source="'.$nameFile.'.'.$sourceExt, $dataEdit);

    $packageName = explode("\n", explode("package ", $data)[1])[0];
    $packageNameNew = str_replace(['/', 'src.'], '.', $pathDir);
    $packageNameNew = ltrim($packageNameNew, ".");
    //echo $packageNameNew."\n";

    $dataEdit = str_replace('package '.$packageName, 'package '.$packageNameNew, $dataEdit);
    //echo $dataEdit;
    //exit();
    file_put_contents($path, $dataEdit);

    //copy($pathDir.'/'.$sourceName, $pathDir.$dirType.'/'.$nameFile.'.'.$sourceExt);

    //if(!in_array($pathDir.'/'.$sourceName, $deleteFile))
        //$deleteFile[] = $pathDir.'/'.$sourceName;
}

foreach($deleteFile as $file) {
    //unlink($file);
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