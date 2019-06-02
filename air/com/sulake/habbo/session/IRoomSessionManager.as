//com.sulake.habbo.session.IRoomSessionManager

package com.sulake.habbo.session{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public /*dynamic*/ interface IRoomSessionManager extends IUnknown {

        function gotoRoom(k:int, _arg_2:String="", _arg_3:String=""):Boolean;
        function gotoRoomNetwork(k:int, _arg_2:int):Boolean;
        function startSession(k:IRoomSession):Boolean;
        function getSession(k:int):IRoomSession;
        function get events():IEventDispatcher;
        function get sessionStarting():Boolean;
        function startGameSession():void;
        function disposeGameSession():void;
        function disposeSession(k:int, _arg_2:Boolean=true):void;

    }
}//package com.sulake.habbo.session

