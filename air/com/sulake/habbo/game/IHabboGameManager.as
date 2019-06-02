//com.sulake.habbo.game.IHabboGameManager

package com.sulake.habbo.game{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;

    public /*dynamic*/ interface IHabboGameManager extends IUnknown {

        function initGameDirectoryConnection():void;
        function startSnowWarGame(k:String):void;
        function startQuickSnowWarGame():void;
        function onSnowWarArenaSessionEnded():void;
        function get events():IEventDispatcher;
        function handleClickOnTile(k:RoomObjectTileMouseEvent):void;
        function handleClickOnHuman(k:int, _arg_2:Boolean, _arg_3:Boolean):void;
        function generateChecksumMismatch():void;
        function handleMouseOverOnHuman(k:int, _arg_2:Boolean, _arg_3:Boolean):void;
        function get gameCenterEnabled():Boolean;
        function get isHotelClosed():Boolean;
        function loadGameClient(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Object):void;
        function loadGameUrl(k:int, _arg_2:String, _arg_3:String, _arg_4:String=""):void;
        function unloadGame(k:int, _arg_2:String, _arg_3:String):void;
        function joinPlayerQueue(k:int):void;
        function leavePlayerQueue(k:int):void;
        function acceptGameInvite(k:int, _arg_2:int):void;
        function showGameCenter(k:String, _arg_2:int=0, _arg_3:Boolean=false):void;
        function showGameCenterByGameName(k:String, _arg_2:String, _arg_3:Boolean=false):void;
        function hideGameCenter():void;
        function getGameNameId(k:int):String;
        function getGameId(k:String):int;
        function getGameAssetURL(k:int, _arg_2:String):String;

    }
}//package com.sulake.habbo.game

