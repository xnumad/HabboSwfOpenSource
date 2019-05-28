package com.sulake.room.object
{
    import com.sulake.core.utils.Map;

    public interface IRoomObjectModelController extends IRoomObjectModel 
    {
        function setNumber(_arg_1:String, _arg_2:Number, _arg_3:Boolean=false):void;
        function setString(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void;
        function setNumberArray(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false):void;
        function setStringArray(_arg_1:String, _arg_2:Array, _arg_3:Boolean=false):void;
        function setStringToStringMap(_arg_1:String, _arg_2:Map, _arg_3:Boolean=false):void;
    }
}
