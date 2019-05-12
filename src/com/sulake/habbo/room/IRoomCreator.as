package com.sulake.habbo.room
{
    import com.sulake.room.IRoomInstance;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.habbo.room.utils.FurniStackingHeightMap;
    import com.sulake.habbo.room.utils.LegacyWallGeometry;
    import com.sulake.habbo.room.utils.TileObjectMap;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;

    public interface IRoomCreator extends IRoomObjectCreator 
    {
        function _Str_10152(_arg_1:int, _arg_2:XML):void;
        function _Str_2881(_arg_1:int):IRoomInstance;
        function _Str_7482(_arg_1:int):void;
        function _Str_19096(_arg_1:int, _arg_2:int):void;
        function _Str_20520(_arg_1:int, _arg_2:String):void;
        function _Str_5146(_arg_1:int):IRoomObjectController;
        function setFurniStackingHeightMap(_arg_1:int, _arg_2:FurniStackingHeightMap):void;
        function getFurniStackingHeightMap(_arg_1:int):FurniStackingHeightMap;
        function _Str_5364(_arg_1:int):LegacyWallGeometry;
        function _Str_15934(_arg_1:int):TileObjectMap;
        function _Str_9515(_arg_1:int, _arg_2:String):Number;
        function _Str_4323(_arg_1:int, _arg_2:String):String;
        function _Str_21966(_arg_1:int, _arg_2:Boolean):void;
        function _Str_17722(_arg_1:int, _arg_2:String):void;
        function get configuration():IHabboConfigurationManager;
        function get roomSessionManager():IRoomSessionManager;
        function get sessionDataManager():ISessionDataManager;
    }
}
