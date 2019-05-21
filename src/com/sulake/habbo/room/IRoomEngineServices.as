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
        function _Str_3321(_arg_1:String):int;
        function getRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function _Str_3652(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function _Str_3391(_arg_1:int, _arg_2:int):int;
        function _Str_6650(_arg_1:int, _arg_2:int, _arg_3:Boolean=true):void;
        function _Str_16645(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:String=null, _arg_5:IStuffData=null, _arg_6:int=-1, _arg_7:int=-1, _arg_8:String=null):void;
        function _Str_7972(_arg_1:Boolean):void;
        function _Str_17948():void;
        function _Str_3637(_arg_1:int):ISelectedRoomObjectData;
        function _Str_7975(_arg_1:int, _arg_2:SelectedRoomObjectData):void;
        function _Str_18960(_arg_1:int, _arg_2:SelectedRoomObjectData):void;
        function _Str_13961(_arg_1:int):ISelectedRoomObjectData;
        function get connection():IConnection;
        function get events():IEventDispatcher;
        function get _Str_19439():IHabboGameManager;
        function _Str_5364(_arg_1:int):LegacyWallGeometry;
        function getFurniStackingHeightMap(_arg_1:int):FurniStackingHeightMap;
        function _Str_15934(_arg_1:int):TileObjectMap;
        function _Str_17216(_arg_1:int):IRoomObjectController;
        function _Str_9577(_arg_1:int):IRoomObjectController;
        function _Str_19405(_arg_1:int):Boolean;
        function _Str_10583():Boolean;
        function _Str_20364(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:String):void;
        function _Str_19247(_arg_1:String, _arg_2:int, _arg_3:String):void;
        function _Str_12390(_arg_1:int, _arg_2:int):void;
        function _Str_11339(_arg_1:int, _arg_2:int):void;
        function _Str_7682():IRoomRenderingCanvas;
        function _Str_19865(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=true):void;
        function get _Str_6249():Boolean;
        function get _Str_6374():Boolean;
        function get _Str_24152():int;
        function get configuration():IHabboConfigurationManager;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;
        function get toolbar():IHabboToolbar;
        function get catalog():IHabboCatalog;
        function get windowManager():IHabboWindowManager;
    }
}
