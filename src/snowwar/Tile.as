package snowwar
{
	import snowwar._Str_231._SafeStr_4028;
	import snowwar._Str_254.Direction8;
	import snowwar._Str_254._SafeStr_4022;
	import snowwar._Str_254._SafeStr_4023;
	import snowwar._Str_254.Location;
	import snowwar._Str_254._SafeStr_4667;
	import snowwar._Str_39.HumanGameObject;
	import snowwar._Str_39.SnowWarGameObject;
	import snowwar._Str_496.SnowWarFurnitureObject;

    public class Tile extends _SafeStr_4023 
    {
        public static const COST:int = 3200; //_SafeStr_13239
        public static const STEP_COST:int = _SafeStr_4667._SafeStr_18698((COST / 2)); //_SafeStr_18674
        public static const STEP_DIAG_COST:int = (COST + STEP_COST); //_SafeStr_18675
        public static const PARA_COST:int = int(Math.sqrt(((Tile.COST * Tile.COST) + (Tile.COST * Tile.COST)))); //_SafeStr_18676

        private var _location:Location;
        private var _adjacentTiles:Array;
        private var _gameObject:SnowWarGameObject;
        private var _tileData:Array;
        private var _fuseObjects:Array;
        private var _blocked:Boolean;
        private var _height:int;

        public function Tile(x:int, y:int)
        {
            this._adjacentTiles = [];
            this._tileData = [x, y, 0];
            this._location = new Location((x * COST), (y * COST), 0);
            this._fuseObjects = [];
        }

        public static function fromLocationX(x:int):int
        {
            return _SafeStr_4667._SafeStr_18698(((x + Tile.STEP_COST) / Tile.COST));
        }

        public static function fromLocationY(y:int):int
        {
            return _SafeStr_4667._SafeStr_18698(((y + Tile.STEP_COST) / Tile.COST));
        }

        public static function toLocationX(x:int):int
        {
            return x * Tile.COST;
        }

        public static function toLocationY(y:int):int
        {
            return y * Tile.COST;
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._location != null)
            {
                this._location.dispose();
                this._location = null;
            }
            this._adjacentTiles = [];
            this._gameObject = null;
            this._tileData = [];
            this._fuseObjects = [];
            this._blocked = false;
        }

        public function get fuseObjects():Array
        {
            return this._fuseObjects;
        }

        public function addObject(object:SnowWarFurnitureObject):void
        {
            this.fuseObjects.push(object);
            this.addHeight(object.height);
        }

        public function addHeight(k:int):void
        {
            this._height = (this._height + k);
            if (this._height < 0)
            {
                this._height = 0;
            }
        }

        public function get _SafeStr_18688():Array
        {
            return this._tileData;
        }

        public function get location():Location
        {
            return this._location;
        }

        public function _SafeStr_18689(k:Location):Boolean
        {
            var _local_2:int = (this._location.x - k.x);
            if (_local_2 < 0)
            {
                _local_2 = -(_local_2);
            }
            var _local_3:int = (this._location.y - k.y);
            if (_local_3 < 0)
            {
                _local_3 = -(_local_3);
            }
            return (_local_2 < STEP_COST) && (_local_3 < STEP_COST);
        }

        public function linkAdjacentTile(tile:Tile, direction:Direction8):void
        {
            this.registerAdjacentTile(tile, direction);
            tile.registerAdjacentTile(this, direction.rotateDirection180Degrees());
        }

        private function registerAdjacentTile(tile:Tile, direction:Direction8):void
        {
            this._adjacentTiles[direction.index()] = tile;
        }

        public function adjacentTile(direction:Direction8):Tile
        {
            return this._adjacentTiles[direction.index()];
        }

        public function walkable(ignoreObject:_SafeStr_4028):Boolean
        {
            var isSelf:Boolean;
            if (ignoreObject)
            {
                isSelf = (((!(this.humanGameObject == null)) && (ignoreObject._SafeStr_18700)) && (this.humanGameObject._SafeStr_13241 == ignoreObject._SafeStr_13236));
            }
            var objectBlocked:Boolean;
            if (this.fuseObjects.length == 1)
            {
                objectBlocked = (!((this.fuseObjects[0] as SnowWarFurnitureObject).walkable));
            }
            else
            {
                if (this.fuseObjects.length > 1)
                {
                    objectBlocked = true;
                }
            }
            return ((!(objectBlocked)) && ((this._gameObject == null) || (isSelf))) && (!(this._blocked));
        }

        public function addActiveGameObject(gameObject:SnowWarGameObject):Boolean
        {
            var added:Boolean;
            if (!this._gameObject)
            {
                this._gameObject = gameObject;
                added = true;
            }
            return added;
        }

        public function removeGameObject():SnowWarGameObject
        {
            var object:SnowWarGameObject;
            if (this._gameObject)
            {
                object = this._gameObject;
                this._gameObject = null;
            }
            return object;
        }

        public function get gameObject():SnowWarGameObject //_SafeStr_18696
        {
            return this._gameObject;
        }

        public function get humanGameObject():HumanGameObject //humanGameObject
        {
            if (((this._gameObject) && (this._gameObject is HumanGameObject)))
            {
                return this.gameObject as HumanGameObject;
            }
            return null;
        }

        public function removeHumanGameObject():HumanGameObject //_SafeStr_18697
        {
            var humanObject:HumanGameObject = this.humanGameObject;
            if (humanObject)
            {
                this._gameObject = null;
            }
            return humanObject;
        }

        override public function distanceTo(k:_SafeStr_4022):int
        {
            var tile:Tile = (k as Tile);
            return this._location.distanceTo(tile.location);
        }

        override public function directionTo(k:_SafeStr_4022):Direction8
        {
            var _local_2:Tile = (k as Tile);
            return this._location.directionTo(_local_2.location);
        }

        override public function getNodeAt(direction:Direction8):_SafeStr_4022
        {
            return this._adjacentTiles[direction.index()];
        }

        override public function directionIsBlocked(direction:Direction8, _arg_2:_SafeStr_4028):Boolean
        {
            return this.walkable(_arg_2);
        }

        override public function getPathCost(direction:Direction8, _arg_2:_SafeStr_4028):int
        {
            if (direction._SafeStr_18701())
            {
                return COST;
            }
            return PARA_COST;
        }

        public function get height():int
        {
            return this._height;
        }

        public function toString():String
        {
            return ((((" X:" + this._location.x) + " Y:") + this._location.y) + " Z:") + this._location.z;
        }

        public function set blocked(k:Boolean):void
        {
            this._blocked = k;
        }
    }
}
