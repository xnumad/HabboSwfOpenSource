//com.sulake.room.IRoomObjectFactory

package com.sulake.room{
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IRoomObjectFactory extends IUnknown {

        function addObjectEventListener(k:Function):void;
        function removeObjectEventListener(k:Function):void;
        function createRoomObjectLogic(k:String):IRoomObjectEventHandler;
        function createRoomObjectManager():IRoomObjectManager;
        function get events():IEventDispatcher;

    }
}//package com.sulake.room

