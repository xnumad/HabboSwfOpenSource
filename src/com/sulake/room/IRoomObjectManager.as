package com.sulake.room
{
    import com.sulake.room.object.IRoomObjectController;

    public interface IRoomObjectManager 
    {
        function dispose():void;
        function createObject(_arg_1:int, _arg_2:uint, _arg_3:String):IRoomObjectController;
        function getObject(_arg_1:int):IRoomObjectController;
        function getObjects():Array;
        function disposeObject(_arg_1:int):Boolean;
        function getObjectCount():int;
        function getObjectWithIndex(_arg_1:int):IRoomObjectController;
        function getObjectCountForType(_arg_1:String):int;
        function getObjectWithIndexAndType(_arg_1:int, _arg_2:String):IRoomObjectController;
        function reset():void;
    }
}
