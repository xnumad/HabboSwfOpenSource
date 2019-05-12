package com.sulake.room
{
    import com.sulake.room.object.IRoomObjectController;

    public interface IRoomObjectManager 
    {
        function dispose():void;
        function _Str_9478(_arg_1:int, _arg_2:uint, _arg_3:String):IRoomObjectController;
        function _Str_3299(_arg_1:int):IRoomObjectController;
        function _Str_9669():Array;
        function _Str_3915(_arg_1:int):Boolean;
        function _Str_4421():int;
        function _Str_5477(_arg_1:int):IRoomObjectController;
        function _Str_9675(_arg_1:String):int;
        function _Str_11503(_arg_1:int, _arg_2:String):IRoomObjectController;
        function reset():void;
    }
}
