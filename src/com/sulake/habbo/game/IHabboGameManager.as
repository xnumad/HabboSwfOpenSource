package com.sulake.habbo.game
{
    import com.sulake.core.runtime.IUnknown;
	import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
    import flash.events.IEventDispatcher;

    public interface IHabboGameManager extends IUnknown 
    {
        function get events():IEventDispatcher;
        function get gameCenterEnabled():Boolean;
        function get _Str_12938():Boolean;
        function loadGameClient(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Object):void;
        function _Str_19055(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:String=""):void;
        function _Str_8716(_arg_1:int, _arg_2:String, _arg_3:String):void;
        function joinPlayerQueue(_arg_1:int):void;
        function _Str_10458(_arg_1:int):void;
        function acceptGameInvite(_arg_1:int, _arg_2:int):void;
        function showGameCenter(_arg_1:String, _arg_2:int=0, _arg_3:Boolean=false):void;
        function showGameCenterByGameName(_arg_1:String, _arg_2:String, _arg_3:Boolean=false):void;
        function _Str_15814():void;
        function _Str_22863(_arg_1:int):String;
        function getGameId(_arg_1:String):int;
        function getGameAssetURL(_arg_1:int, _arg_2:String):String;
		function initGameDirectoryConnection():void;
		function _SafeStr_7619(k:String):void;
		function _SafeStr_7620():void;
		function _SafeStr_7621():void;
		function _SafeStr_7624():void;
		function _SafeStr_7622(k:RoomObjectTileMouseEvent):void;
		function _SafeStr_7623(k:int, _arg_2:Boolean, _arg_3:Boolean):void;
		function _SafeStr_7625(k:int, _arg_2:Boolean, _arg_3:Boolean):void;
    }
}
