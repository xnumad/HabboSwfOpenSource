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
dirToArray("src");

$deleteFile = array();
foreach ($paths as $path => $data) {
    if (strpos($data, 'extends ByteArrayAsset') === false && strpos($data, 'extends BitmapAsset') === false)
        continue;

    if (strpos($data, '[Embed(') === false)
        continue;

    $parts = explode('\\', $path);
    $file = array_pop($parts);
    $pathDir = implode('\\', $parts);

    if(strpos($file, "_Str") === FALSE)
        continue;

    $sourceName = "";
    if (strpos($data, 'source="') !== false) {
        $sourceName = explode('"', explode('source="', $data)[1])[0];
    }

    $sourceName = explode('.', $sourceName)[0];
    if ($sourceName == "")
        continue;

    if($path == $pathDir."\\".$sourceName.".as")
        continue;

    $nameClass = explode('.', $file)[0];
    
    $searth = $nameClass; //oldName file
    $replace = $sourceName; //newName 

    if($searth == $replace)
        continue;

    echo $searth." > ".$replace. "\n";

    searthAndReplaceAll($data, $searth, $replace);
    copy($path, $pathDir."/".$sourceName.".as");
    $deleteFile[] = $path;
}

foreach($deleteFile as $file) {
    unlink($file);
}

function searthAndReplaceAll($data, $searth, $replace) {
    global $paths;
    foreach ($paths as $path => $data) {
        replaceAll($data, $searth, $replace, $path);
    }
}

function replaceAll($data, $searth, $replace, $path) {
    global $paths;
    $save = false;
    $diff = 0;
    foreach(strpos_all($data, $searth) as $numLign) {
        
        if(is_numeric(substr($data, ($numLign - $diff) + strlen($searth), 1)))
            continue;
        
        $save = true;
        $data = substr_replace($data, $replace, $numLign - $diff, strlen($searth));
        $diff += strlen($searth) - strlen($replace);

        echo "Edit: ".$path."\n"; 
    }

    if($save) {
        file_put_contents($path, $data);
        $paths[$path] = $data;
    }
}

function strpos_all($haystack, $needle) {
    $offset = 0;
    $allpos = array();
    while (($pos = strpos($haystack, $needle, $offset)) !== FALSE) {
        $offset   = $pos + 1;
        $allpos[] = $pos;
    }
    return $allpos;
}