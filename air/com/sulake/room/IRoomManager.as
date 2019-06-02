//com.sulake.room.IRoomManager

package com.sulake.room{
    import com.sulake.core.runtime.IUnknown;

    public /*dynamic*/ interface IRoomManager extends IUnknown {

        function initialize(k:XML, _arg_2:IRoomManagerListener):Boolean;
        function update(k:uint):void;
        function setContentLoader(k:IRoomContentLoader):void;
        function addObjectUpdateCategory(k:int):void;
        function removeObjectUpdateCategory(k:int):void;
        function createRoom(k:String, _arg_2:XML):IRoomInstance;
        function disposeRoom(k:String):Boolean;
        function getRoom(k:String):IRoomInstance;
        function getRoomWithIndex(k:int):IRoomInstance;
        function getRoomCount():int;
        function isContentAvailable(k:String):Boolean;

    }
}//package com.sulake.room

