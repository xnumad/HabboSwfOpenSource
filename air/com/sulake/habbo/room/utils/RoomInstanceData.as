//com.sulake.habbo.room.utils.RoomInstanceData

package com.sulake.habbo.room.utils{
    import com.sulake.core.utils.Map;
    import __AS3__.vec.Vector;

    public class RoomInstanceData {

        private var _roomId:int;
        private var _furniStackingHeightMap:FurniStackingHeightMap;
        private var _legacyGeometry:LegacyWallGeometry;
        private var _tileObjectMap:TileObjectMap;
        private var _roomCamera:RoomCamera;
        private var _selectedObject:SelectedRoomObjectData;
        private var _placedObject:SelectedRoomObjectData;
        private var _worldType:String;
        private var _furnitureStack:Map;
        private var _wallItemStack:Map;
        private var _mouseButtonCursorOwners:Array;

        public function RoomInstanceData(k:int);

        public function get roomId():int;

        public function get furniStackingHeightMap():FurniStackingHeightMap;

        public function set furniStackingHeightMap(k:FurniStackingHeightMap):void;

        public function get legacyGeometry():LegacyWallGeometry;

        public function get tileObjectMap():TileObjectMap;

        public function get roomCamera():RoomCamera;

        public function get worldType():String;

        public function set worldType(k:String):void;

        public function get selectedObject():SelectedRoomObjectData;

        public function set selectedObject(k:SelectedRoomObjectData):void;

        public function get placedObject():SelectedRoomObjectData;

        public function set placedObject(k:SelectedRoomObjectData):void;

        public function dispose():void;

        public function addFurnitureData(k:FurnitureData):void;

        public function getFurnitureData():FurnitureData;

        public function getFurnitureDataListByTypeId():Vector.<FurnitureData>;

        public function getFurnitureDataWithId(k:int):FurnitureData;

        public function addWallItemData(k:FurnitureData):void;

        public function getWallItemData():FurnitureData;

        public function getWallItemDataWithId(k:int):FurnitureData;

        public function addButtonMouseCursorOwner(k:String):Boolean;

        public function removeButtonMouseCursorOwner(k:String):Boolean;

        public function hasButtonMouseCursorOwners():Boolean;


    }
}//package com.sulake.habbo.room.utils

