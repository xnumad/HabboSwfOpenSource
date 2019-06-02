//com.sulake.habbo.session.IRoomHandlerListener

package com.sulake.habbo.session{
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IRoomHandlerListener {

        function sessionUpdate(k:int, _arg_2:String):void;
        function sessionReinitialize(k:int, _arg_2:int):void;
        function getSession(k:int):IRoomSession;
        function get events():IEventDispatcher;

    }
}//package com.sulake.habbo.session

