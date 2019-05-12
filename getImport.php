<?php 
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
foreach($paths as $path) {
    if($path == "src")
        continue;
    $parts = explode('\\', $path);
    $file = array_pop($parts);

    if (strpos($file, ".") === false)
        continue;
    $fileName = explode('.', $file)[0];
    $ext = explode('.', $file)[1];
    if ($ext !== "as")
        continue;

    array_shift($parts);
    $pathDir = implode('/', $parts);

    $tmp .= "import ". str_replace('/', '.', $pathDir) . '.' . $fileName . "; " . str_replace('/', '.', $pathDir) . '.' . $fileName . ";\n";
}

$tmp = str_replace("import .", "import ", $tmp);
$tmp = str_replace("; .", "; ", $tmp);

$tmp = str_replace("import com.sulake.habbo.ui.widget.camera.PhotoPurchaseConfirmationDialog; com.sulake.habbo.ui.widget.camera.PhotoPurchaseConfirmationDialog;", "", $tmp);
$tmp = str_replace("import com.sulake.core.runtime.Profiler; com.sulake.core.runtime.Profiler;", "", $tmp);
$tmp = str_replace("import com.sulake.core.runtime.InterfaceStructList; com.sulake.core.runtime.InterfaceStructList;", "", $tmp);
$tmp = str_replace("import com.sulake.core.runtime.InterfaceStruct; com.sulake.core.runtime.InterfaceStruct;", "", $tmp);
$tmp = str_replace("import com.sulake.core.runtime.ComponentInterfaceQueue; com.sulake.core.runtime.ComponentInterfaceQueue;", "", $tmp);
$tmp = str_replace("import com.sulake.core.communication.wireformat.EvaMessageDataWrapper; com.sulake.core.communication.wireformat.EvaMessageDataWrapper;", "", $tmp);
$tmp = str_replace("import com.sulake.core.assets.loaders.AssetLoaderEventBroker; com.sulake.core.assets.loaders.AssetLoaderEventBroker;", "", $tmp);
$tmp = str_replace("import com.hurlant.math.MontgomeryReduction; com.hurlant.math.MontgomeryReduction;", "", $tmp);
$tmp = str_replace("import com.hurlant.math.IReduction; com.hurlant.math.IReduction;", "", $tmp);
$tmp = str_replace("import com.hurlant.math.ClassicReduction; com.hurlant.math.ClassicReduction;", "", $tmp);
$tmp = str_replace("import com.hurlant.math.BarrettReduction; com.hurlant.math.BarrettReduction;", "", $tmp);
$tmp = str_replace("import com.sulake.core.runtime.ComponentInterfaceQueue; com.sulake.core.runtime.ComponentInterfaceQueue;", "", $tmp);

file_put_contents("import.txt", $tmp);