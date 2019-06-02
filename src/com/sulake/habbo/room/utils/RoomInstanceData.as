package com.sulake.habbo.room.utils
{
    import com.sulake.core.utils.Map;

    public class RoomInstanceData 
    {
        private var _roomId:int = 0;
        private var _furniStackingHeightMap:FurniStackingHeightMap = null;
        private var _legacyGeometry:LegacyWallGeometry = null;
        private var _tileObjectMap:TileObjectMap = null;
        private var _roomCamera:RoomCamera = null;
        private var _selectedObject:SelectedRoomObjectData = null;
        private var _placedObject:SelectedRoomObjectData = null;
        private var _worldType:String = null;
        private var _furnitureStack:Map;
        private var _wallItemStack:Map;
        private var _mouseButtonCursorOwners:Array;

        public function RoomInstanceData(k:int)
        {
            this._furnitureStack = new Map();
            this._wallItemStack = new Map();
            this._mouseButtonCursorOwners = [];
            super();
            this._roomId = k;
            this._legacyGeometry = new LegacyWallGeometry();
            this._roomCamera = new RoomCamera();
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function get _Str_18267():FurniStackingHeightMap
        {
            return this._furniStackingHeightMap;
        }

        public function set _Str_18267(k:FurniStackingHeightMap):void
        {
            if (this._furniStackingHeightMap != null)
            {
                this._furniStackingHeightMap.dispose();
            }
            this._furniStackingHeightMap = k;
            if (this._tileObjectMap)
            {
                this._tileObjectMap.dispose();
            }
            if (this._furniStackingHeightMap)
            {
                this._tileObjectMap = new TileObjectMap(this._furniStackingHeightMap.width, this._furniStackingHeightMap.height);
            }
        }

        public function get legacyGeometry():LegacyWallGeometry
        {
            return this._legacyGeometry;
        }

        public function get tileObjectMap():TileObjectMap
        {
            return this._tileObjectMap;
        }

        public function get roomCamera():RoomCamera
        {
            return this._roomCamera;
        }

        public function get _Str_17166():String
        {
            return this._worldType;
        }

        public function set _Str_17166(k:String):void
        {
            this._worldType = k;
        }

        public function get _Str_16852():SelectedRoomObjectData
        {
            return this._selectedObject;
        }

        public function set _Str_16852(k:SelectedRoomObjectData):void
        {
            if (this._selectedObject != null)
            {
                this._selectedObject.dispose();
            }
            this._selectedObject = k;
        }

        public function get _Str_15689():SelectedRoomObjectData
        {
            return this._placedObject;
        }

        public function set _Str_15689(k:SelectedRoomObjectData):void
        {
            if (this._placedObject != null)
            {
                this._placedObject.dispose();
            }
            this._placedObject = k;
        }

        public function dispose():void
        {
            if (this._furniStackingHeightMap != null)
            {
                this._furniStackingHeightMap.dispose();
                this._furniStackingHeightMap = null;
            }
            if (this._legacyGeometry != null)
            {
                this._legacyGeometry.dispose();
                this._legacyGeometry = null;
            }
            if (this._roomCamera != null)
            {
                this._roomCamera.dispose();
                this._roomCamera = null;
            }
            if (this._selectedObject != null)
            {
                this._selectedObject.dispose();
                this._selectedObject = null;
            }
            if (this._placedObject != null)
            {
                this._placedObject.dispose();
                this._placedObject = null;
            }
            if (this._furnitureStack != null)
            {
                this._furnitureStack.dispose();
                this._furnitureStack = null;
            }
            if (this._wallItemStack != null)
            {
                this._wallItemStack.dispose();
                this._wallItemStack = null;
            }
            if (this._tileObjectMap != null)
            {
                this._tileObjectMap.dispose();
                this._tileObjectMap = null;
            }
        }

        public function addFurnitureData(k:FurnitureData):void
        {
            if (k != null)
            {
                this._furnitureStack.remove(k.id);
                this._furnitureStack.add(k.id, k);
            }
        }

        public function getFurnitureData():FurnitureData
        {
            if (this._furnitureStack.length > 0)
            {
                return this.getFurnitureDataWithId(this._furnitureStack.getKey(0));
            }
            return null;
        }

        public function getFurnitureDataWithId(k:int):FurnitureData
        {
            var _local_2:FurnitureData = this._furnitureStack.remove(k);
            return _local_2;
        }

        public function addWallItemData(k:FurnitureData):void
        {
            if (k != null)
            {
                this._wallItemStack.remove(k.id);
                this._wallItemStack.add(k.id, k);
            }
        }

        public function getWallItemData():FurnitureData
        {
            if (this._wallItemStack.length > 0)
            {
                return this.getWallItemDataWithId(this._wallItemStack.getKey(0));
            }
            return null;
        }

        public function getWallItemDataWithId(k:int):FurnitureData
        {
            var _local_2:FurnitureData = this._wallItemStack.remove(k);
            return _local_2;
        }

        public function addButtonMouseCursorOwner(k:String):Boolean
        {
            var _local_2:int = this._mouseButtonCursorOwners.indexOf(k);
            if (_local_2 == -1)
            {
                this._mouseButtonCursorOwners.push(k);
                return true;
            }
            return false;
        }

        public function removeButtonMouseCursorOwner(k:String):Boolean
        {
            var _local_2:int = this._mouseButtonCursorOwners.indexOf(k);
            if (_local_2 > -1)
            {
                this._mouseButtonCursorOwners.splice(_local_2, 1);
                return true;
            }
            return false;
        }

        public function hasButtonMouseCursorOwners():Boolean
        {
            return this._mouseButtonCursorOwners.length > 0;
        }
    }
}
