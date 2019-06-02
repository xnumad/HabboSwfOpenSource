//com.sulake.habbo.room.IRoomCreator

package com.sulake.habbo.room{
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.core.runtime.ICoreConfiguration;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;

    public /*dynamic*/ interface IRoomCreator extends IRoomObjectCreator {

        function initializeRoom(k:int, _arg_2:XML):void;
        function getRoom(k:int):IRoomInstance;
        function disposeRoom(k:int):void;
        function setOwnUserId(k:int, _arg_2:int):void;
        function setWorldType(k:int, _arg_2:String):void;
        function getObjectRoom(k:int):IRoomObjectController;
        function setFurniStackingHeightMap(k:int, _arg_2:FurniStackingHeightMap):void;
        function getFurniStackingHeightMap(k:int):IFurniStackingHeightMap;
        function getLegacyGeometry(k:int):LegacyWallGeometry;
        function getTileObjectMap(k:int):ITileObjectMap;
        function getRoomNumberValue(k:int, _arg_2:String):Number;
        function getRoomStringValue(k:int, _arg_2:String):String;
        function setIsPlayingGame(k:int, _arg_2:Boolean):void;
        function refreshTileObjectMap(k:int, _arg_2:String):void;
        function get configuration():ICoreConfiguration;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;

    }
}//package com.sulake.habbo.room

