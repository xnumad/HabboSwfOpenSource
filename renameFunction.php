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

$tmpReplace = array();
$tmp = "";
foreach ($paths as $path => $data) {

    $parts = explode(DIRECTORY_SEPARATOR, $path);
    $file = array_pop($parts);
    $pathDir = implode(DIRECTORY_SEPARATOR, $parts);
    $airPath = "air".str_replace("src", "", $pathDir).DIRECTORY_SEPARATOR.$file;

    if(!file_exists($airPath))
        continue;

    if(strpos($data, ' function ') === FALSE)
        continue;

    $nameClass = explode('.', $file)[0];

    if($nameClass != "ISessionDataManager")
        continue;

    $functionListOld = getFunctionList($data);
    if(count($functionListOld) == 0)
        continue;

    $dataTwo = file_get_contents($airPath);
    $functionListNew = getFunctionList($dataTwo);
    if(count($functionListNew) == 0)
        continue;

    $diffCount = abs(count($functionListNew) - count($functionListOld));

    if ($diffCount >= 8) {
        //$tmp .= $nameClass.": " .count($functionListNew)." - ". count($functionListOld)."\n";
        //continue;
    }

    for($i = 0; $i < count($functionListOld); $i++) {
        $old = $functionListOld[$i];
        $newName = getNewName($functionListNew, $functionListOld, $old['param']);

        if(strpos($old['name'], "_Str_") === FALSE || $newName == "")
            continue;

        $keyOld = $old['name'];
        $keyNew = $newName;

        if(in_array($keyNew, $tmpReplace))
            $dontReplace[] = $keyNew;

        $tmpReplace[$keyOld] = $keyNew;
    }

    //if(count($tmpReplace) > 0)
        //$tmp .= $nameClass." (".$diffCount.")\n".print_r($tmpReplace, true)."\n";
}

foreach ($tmpReplace as $key => $value) {
    //if(in_array($value, $dontReplace))
        //continue;
    $tmp .= $key." => ".$value."\n";
    //searthAndReplaceAll($data, $key, $value);
}

file_put_contents("analyse.txt", $tmp);

function getNewName(&$functionListNew, $functionListOld, $param) {
    for ($i = 0; $i < count($functionListNew); $i++) {
        $new = $functionListNew[$i];

        if($new['param'] != $param)
            continue;

        array_splice($functionListNew, $i, 1);

        if(nameExist($new['name'], $functionListOld)) {
            //echo "Doublons: ". $new['name']."\n";
            break;
        }

        return $new['name'];
    }

    return "";
}

function nameExist($key, $functionListOld) {
    foreach($functionListOld as $value)
    {
        if($key == $value['name'])
            return true;
    }
    return false;
}

function getFunctionList($data) {
    $data = str_replace("\r", "", $data);

    $functionList = array();
    foreach(array_slice(explode(' function ', $data), 1) as $lign) {
        $lign = explode("\n", $lign)[0];
        if(strpos($lign, ":") === FALSE)
            continue;

        $exp = explode('(', $lign);
        if (count($exp) != 2)
            continue;

        $nameFunction = $exp[0];
        $nameFunction = str_replace(["get ", "set "], "", $nameFunction);
        
        $paramFunction = '('.$exp[1];
        $paramFunction = str_replace(";", "", $paramFunction);
        $paramFunction = str_replace("_arg_1", "k", $paramFunction);

        $functionList[] = array("name" => $nameFunction, "param" => $paramFunction);

    }

    return $functionList;
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