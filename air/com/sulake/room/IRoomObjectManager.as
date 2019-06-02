//com.sulake.room.IRoomObjectManager

package com.sulake.room{
    import com.sulake.room.object.IRoomObjectController;

    public /*dynamic*/ interface IRoomObjectManager {

        function dispose():void;
        function createObject(k:int, _arg_2:uint, _arg_3:String, _arg_4:int):IRoomObjectController;
        function getObject(k:int):IRoomObjectController;
        function getObjects():Array;
        function disposeObject(k:int):Boolean;
        function getObjectCount():int;
        function getObjectWithIndex(k:int):IRoomObjectController;
        function getObjectCountForType(k:String):int;
        function getObjectWithIndexAndType(k:int, _arg_2:String):IRoomObjectController;
        function reset():void;

    }
}//package com.sulake.room

