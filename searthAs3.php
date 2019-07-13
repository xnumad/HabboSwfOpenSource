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

                $paths[$value] = str_replace("\r", "", file_get_contents($dir . DIRECTORY_SEPARATOR . $value));
            }
        }
    }
}
dirToArray("src");

file_put_contents("data.txt", print_r($paths["HabboMessages.as"], true));

$HabboMessagesData = $paths["HabboMessages.as"];

$INCOMING_PACKETS = array();
foreach (array_slice(explode('INCOMING_PACKETS[', $HabboMessagesData), 1) as $lign) {
    $lign = explode("\n", $lign)[0];
    if (strpos($lign, "]") === false) {
        continue;
    }

    $id = explode("]", $lign)[0];
    $name = explode(";", explode("= ", $lign)[1])[0];

    $INCOMING_PACKETS[$id] = $name;
}
//file_put_contents("incoming.txt", print_r($INCOMING_PACKETS, true));

$tmp = "";
foreach($INCOMING_PACKETS as $id => $name) {
    $data = $paths[$name.".as"];

    if($data == "")
        continue;

    if(strpos($data, "public function ".$name."(") === FALSE)
        continue;
    
    $super = explode("{", explode("}", explode("public function ".$name."(", $data)[1])[0])[1];
    $super = str_replace("\n", "", $super);

    $superCall = explode(")", explode(", ", $super)[1])[0];

    if($superCall == "_arg_2")
        continue;

    $dataTwo = $paths[$superCall.".as"];

    if($dataTwo == "")
        continue;

    if(strpos($dataTwo, "public function parse(") === FALSE)
        continue;

    $parse = explode("{", explode("}", explode("public function parse(", $dataTwo)[1])[0])[1];
    //$parse = str_replace("\n", "", $parse);

    $tmp .= $name." > ".$parse."\n";
    //break;
}

file_put_contents("data.txt", $tmp);





/*$OUTGOING_PACKETS = array();
foreach (array_slice(explode('OUTGOING_PACKETS[', $HabboMessagesData), 1) as $lign) {
    $lign = explode("\n", $lign)[0];
    if (strpos($lign, "]") === false) {
        continue;
    }

    $id = explode("]", $lign)[0];
    $name = explode(";", explode("= ", $lign)[1])[0];

    $OUTGOING_PACKETS[$id] = $name;
}
file_put_contents("ougoing.txt", print_r($OUTGOING_PACKETS, true));*/