package com.sulake.habbo.session
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;

    public interface IRoomSessionManager extends IUnknown 
    {
        function gotoRoom(_arg_1:int, _arg_2:String="", _arg_3:String=""):Boolean;
        function gotoRoomNetwork(_arg_1:int, _arg_2:int):Boolean;
        function startSession(_arg_1:IRoomSession):Boolean;
        function getSession(_arg_1:int):IRoomSession;
        function get events():IEventDispatcher;
        function get sessionStarting():Boolean;
        function startGameSession():void;
        function disposeGameSession():void;
        function disposeSession(_arg_1:int, _arg_2:Boolean=true):void;
    }
}
