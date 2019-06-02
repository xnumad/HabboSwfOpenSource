//com.sulake.room.object.IRoomObjectModel

package com.sulake.room.object{
    import com.sulake.core.utils.Map;

    public /*dynamic*/ interface IRoomObjectModel {

        function hasNumber(k:String):Boolean;
        function hasNumberArray(k:String):Boolean;
        function hasString(k:String):Boolean;
        function hasStringArray(k:String):Boolean;
        function getNumber(k:String):Number;
        function getString(k:String):String;
        function getNumberArray(k:String):Array;
        function getStringArray(k:String):Array;
        function getUpdateID():int;
        function getStringToStringMap(k:String):Map;

    }
}//package com.sulake.room.object

