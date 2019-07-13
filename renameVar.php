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

    if(strpos($data, ' var ') === FALSE || strpos($data, ' const ') === FALSE)
        continue;

    $nameClass = explode('.', $file)[0];

    if($nameClass != "AvatarDirectionAngle")
        continue;
    
    $varsListOld = getVarsList($data);
    if(count($varsListOld) == 0)
        continue;

    $dataTwo = file_get_contents($airPath);
    $varsListNew = getVarsList($dataTwo);
    if(count($varsListNew) == 0)
        continue;

    //print_r($varsListNew);

    $diffCount = abs(count($varsListNew) - count($varsListOld));

    if ($diffCount >= 3) {
        $tmp .= $nameClass.": " .count($functionListNew)." - ". count($functionListOld)."\n";
        continue;
    }

    for($i = 0; $i < count($varsListOld); $i++) {
        $old = $varsListOld[$i];
        $newName = getNewName($varsListNew, $varsListOld, $old['param']);

        //if(strpos($old['name'], "_Str_") === FALSE || $newName == "")
            //continue;

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

function getVarsList($data) {
    $data = str_replace("\r", "", $data);

    $vars = array();

    $mainExplode = array();
    $mainExplode = array_merge($mainExplode, array_slice(explode('private var ', $data), 1));
    $mainExplode = array_merge($mainExplode, array_slice(explode('public var ', $data), 1));
    $mainExplode = array_merge($mainExplode, array_slice(explode('static const ', $data), 1));
    $mainExplode = array_merge($mainExplode, array_slice(explode('static var ', $data), 1));

    foreach($mainExplode as $lign) {
        $lign = explode("\n", $lign)[0];

        $exp = explode(':', $lign);

        $name = $exp[0];
        $param = $exp[1];
        if(strpos($param, " = ") !== FALSE) {
            $param = explode(" = ", $param)[0].";";
        }

        $vars[] = array("name" => $name, "param" => $param);

    }

    return $vars;
}

foreach ($tmpReplace as $key => $value) {
    //if(in_array($value, $dontReplace))
        //continue;
    $tmp .= $key." => ".$value."\n";
    //searthAndReplaceAll($data, $key, $value);
}

function getNewName(&$varsListNew, $varsListOld, $param) {
    for ($i = 0; $i < count($varsListNew); $i++) {
        $new = $varsListNew[$i];

        if($new['param'] != $param)
            continue;

        array_splice($varsListNew, $i, 1);

        if(nameExist($new['name'], $varsListOld)) {
            //echo "Doublons: ". $new['name']."\n";
            break;
        }

        return $new['name'];
    }

    return "";
}

function nameExist($key, $varsListOld) {
    foreach($varsListOld as $value)
    {
        if($key == $value['name'])
            return true;
    }
    return false;
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