package com.sulake.room
{
    import com.sulake.core.runtime.IUnknown;

    public interface IRoomManager extends IUnknown 
    {
        function initialize(_arg_1:XML, _arg_2:IRoomManagerListener):Boolean;
        function update(_arg_1:uint):void;
        function setContentLoader(_arg_1:IRoomContentLoader):void;
        function addObjectUpdateCategory(_arg_1:int):void;
        function removeObjectUpdateCategory(_arg_1:int):void;
        function createRoom(_arg_1:String, _arg_2:XML):IRoomInstance;
        function disposeRoom(_arg_1:String):Boolean;
        function getRoom(_arg_1:String):IRoomInstance;
        function getRoomWithIndex(_arg_1:int):IRoomInstance;
        function getRoomCount():int;
        function isContentAvailable(_arg_1:String):Boolean;
    }
}
