package com.sulake.room.object
{
    import com.sulake.core.utils.Map;

    public interface IRoomObjectModel 
    {
        function hasNumber(_arg_1:String):Boolean;
        function hasNumberArray(_arg_1:String):Boolean;
        function hasString(_arg_1:String):Boolean;
        function hasStringArray(_arg_1:String):Boolean;
        function getNumber(_arg_1:String):Number;
        function getString(_arg_1:String):String;
        function getNumberArray(_arg_1:String):Array;
        function getStringArray(_arg_1:String):Array;
        function getUpdateID():int;
        function getStringToStringMap(_arg_1:String):Map;
    }
}
