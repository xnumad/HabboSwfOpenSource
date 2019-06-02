package com.sulake.habbo.room
{
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.utils.SelectedRoomObjectData;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.utils.TileObjectMap;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.window.IHabboWindowManager;

    public interface IRoomEngineServices extends IRoomObjectCreator 
    {
        function getRoom(_arg_1:int):IRoomInstance;
        function getRoomObjectCategory(_arg_1:String):int;
        function getRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectWithIndex(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectCount(_arg_1:int, _arg_2:int):int;
        function updateObjectRoomWindow(_arg_1:int, _arg_2:int, _arg_3:Boolean=true):void;
        function setObjectMoverIconSprite(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void;
        function setObjectMoverIconSpriteVisible(_arg_1:Boolean):void;
        function removeObjectMoverIconSprite():void;
        function getSelectedObjectData(_arg_1:int):ISelectedRoomObjectData;
        function setSelectedObjectData(_arg_1:int, _arg_2:SelectedRoomObjectData):void;
        function setPlacedObjectData(_arg_1:int, _arg_2:SelectedRoomObjectData):void;
        function getPlacedObjectData(_arg_1:int):ISelectedRoomObjectData;
        function get connection():IConnection;
        function get events():IEventDispatcher;
        function get gameEngine():IHabboGameManager;
        function getLegacyGeometry(_arg_1:int):LegacyWallGeometry;
        function getFurniStackingHeightMap(_arg_1:int):FurniStackingHeightMap;
        function _Str_15934(_arg_1:int):TileObjectMap;
        function getSelectionArrow(_arg_1:int):IRoomObjectController;
        function getTileCursor(_arg_1:int):IRoomObjectController;
        function getIsPlayingGame(_arg_1:int):Boolean;
        function getActiveRoomIsPlayingGame():Boolean;
        function _Str_20364(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void;
        function requestMouseCursor(_arg_1:String, _arg_2:int, _arg_3:String):void;
        function addFloorHole(_arg_1:int, _arg_2:int):void;
        function removeFloorHole(_arg_1:int, _arg_2:int):void;
        function getActiveRoomActiveCanvas():IRoomRenderingCanvas;
        function requestBadgeImageAsset(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void;
        function get getIsSelectedObjectInValidPosition():Boolean;
        function get setIsSelectedObjectInValidPosition():Boolean;
        function get playerUnderCursor():int;
        function get configuration():IHabboConfigurationManager;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;
        function get toolbar():IHabboToolbar;
        function get catalog():IHabboCatalog;
        function get windowManager():IHabboWindowManager;
    }
}
