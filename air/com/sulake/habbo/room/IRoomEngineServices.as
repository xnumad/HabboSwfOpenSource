//com.sulake.habbo.room.IRoomEngineServices

package com.sulake.habbo.room{
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.room.utils.SelectedRoomObjectData;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.renderer.IRoomRenderingCanvas;
    import com.sulake.core.runtime.ICoreConfiguration;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.window.IHabboWindowManager;

    public /*dynamic*/ interface IRoomEngineServices extends IRoomObjectCreator {

        function get activeRoomId():int;
        function getRoom(k:int):IRoomInstance;
        function getRoomObjectCategory(k:String):int;
        function getRoomObject(k:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectWithIndex(k:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectCount(k:int, _arg_2:int):int;
        function updateObjectRoomWindow(k:int, _arg_2:int, _arg_3:Boolean=true):void;
        function setObjectMoverIconSprite(k:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void;
        function setObjectMoverIconSpriteVisible(k:Boolean):void;
        function setIsSelectedObjectInValidPosition(k:Boolean):void;
        function removeObjectMoverIconSprite():void;
        function getSelectedObjectData(k:int):ISelectedRoomObjectData;
        function setSelectedObjectData(k:int, _arg_2:SelectedRoomObjectData):void;
        function setPlacedObjectData(k:int, _arg_2:SelectedRoomObjectData):void;
        function getPlacedObjectData(k:int):ISelectedRoomObjectData;
        function get connection():IConnection;
        function get events():IEventDispatcher;
        function get gameEngine():IHabboGameManager;
        function getLegacyGeometry(k:int):LegacyWallGeometry;
        function getFurniStackingHeightMap(k:int):IFurniStackingHeightMap;
        function getTileObjectMap(k:int):ITileObjectMap;
        function getSelectionArrow(k:int):IRoomObjectController;
        function getTileCursor(k:int):IRoomObjectController;
        function getIsPlayingGame(k:int):Boolean;
        function getActiveRoomIsPlayingGame():Boolean;
        function requestRoomAdImage(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String, _arg_6:int):void;
        function requestMouseCursor(k:String, _arg_2:int, _arg_3:String):void;
        function addFloorHole(k:int, _arg_2:int):void;
        function removeFloorHole(k:int, _arg_2:int):void;
        function getActiveRoomActiveCanvas():IRoomRenderingCanvas;
        function requestBadgeImageAsset(k:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void;
        function get isDecorateMode():Boolean;
        function get isGameMode():Boolean;
        function get playerUnderCursor():int;
        function get configuration():ICoreConfiguration;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;
        function get toolbar():IHabboToolbar;
        function get catalog():IHabboCatalog;
        function get windowManager():IHabboWindowManager;

    }
}//package com.sulake.habbo.room

