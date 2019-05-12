package snowwar
{
	import com.sulake.core.utils.Map;
    import snowwar._Str_231.SynchronizedGameStage;
    import snowwar._Str_254.Direction360;
    import snowwar._Str_254.Direction8;
    import snowwar._Str_231.SynchronizedGameArena;
    import snowwar._Str_496.SnowWarGameStageMessageParser;
    import snowwar._Str_496.SnowWarFurnitureObject;
    import snowwar._Str_254.Location;
    import snowwar._Str_39.SnowWarGameObject;
    import snowwar._Str_254._SafeStr_4030;

    public class SnowWarGameStage extends SynchronizedGameStage 
    {
        public static const _SafeStr_18856:int = 25;
        public static const _SafeStr_18857:int = 25;
        private static const TILE_STATE_VOID:int = 100000;

        private var _tileMap:Array;

        public function SnowWarGameStage()
        {
            this._tileMap = [];
            super();
        }

        public static function _SafeStr_18859(k:Tile):Direction8
        {
            return Direction360.direction360ValueToDirection8(Direction360._SafeStr_18792((_SafeStr_18856 - k._SafeStr_18688[0]), (_SafeStr_18857 - k._SafeStr_18688[1])));
        }

        override public function dispose():void
        {
            var x:int;
            var y:int;
            var tile:Tile;
            super.dispose();
            if (((this._tileMap) && (this._tileMap.length > 0)))
            {
                x = 0;
                while (x < this._tileMap.length)
                {
                    y = 0;
                    while (y < (this._tileMap[0] as Array).length)
                    {
                        tile = this._tileMap[x][y];
                        if (tile)
                        {
                            tile.dispose();
                        }
                        y++;
                    }
                    x++;
                }
            }
            this._tileMap = [];
        }

        override public function initialize(gameArena:SynchronizedGameArena, gameStageMessageParser:SnowWarGameStageMessageParser):void
        {
            super.initialize(gameArena, gameStageMessageParser);
            if (_gameObjects == null)
            {
                _gameObjects = new Map();
            }
            this.initializeTileMap(gameStageMessageParser);
            this.initializeFuseObjects(gameStageMessageParser.fuseObjects);
        }

        private function initializeFuseObjects(k:Array):void
        {
            var object:SnowWarFurnitureObject;
            var tile:Tile;
            for each (object in k)
            {
                tile = this.getTileAt(object.x, object.y);
                if (tile)
                {
                    tile.addObject(object);
                    this.updateTiles(object);
                }
            }
        }

        private function updateTiles(object:SnowWarFurnitureObject):void
        {
            var tile:Tile;
            var index:int;
            var oldWidth:int;
            var direction:int = object.direction;
            var width:int = object.width;
            var length:int = object.length;
			
            if (((direction == Direction8.E.index()) || (direction == Direction8.W.index())))
            {
                oldWidth = width;
                width = length;
                length = oldWidth;
            }
			
            index = 1;
            while (index < width)
            {
                tile = this.getTileAt((object.x + index), object.y);
                if (tile)
                {
                    tile.addHeight(object.height);
                    if (!object.walkable)
                    {
                        tile.blocked = true;
                    }
                }
                index++;
            }
            index = 1;
            while (index < length)
            {
                tile = this.getTileAt(object.x, (object.y + index));
                if (tile)
                {
                    tile.addHeight(object.height);
                    if (!object.walkable)
                    {
                        tile.blocked = true;
                    }
                }
                index++;
            }
        }

        public function addSnowWarGameObject(object:SnowWarGameObject):void
        {
            var tile:Tile = this.getTileAt(Tile.fromLocationX(object.location3D.x), Tile.fromLocationY(object.location3D.y));
            if (tile)
            {
                tile.addActiveGameObject(object);
            }
        }

        private function initializeTileMap(gameStageMessageParser:SnowWarGameStageMessageParser):void
        {
            var tile:Tile;
            var y:int;
            var tileNE:Tile;
            var tileN:Tile;
            var tileNW:Tile;
            var tileW:Tile;
            var parsedHeightMap:Array = this.parseHeightMap(gameStageMessageParser.model, gameStageMessageParser.width, gameStageMessageParser.height);
            this._tileMap = [];
            var x:int;
            while (x < gameStageMessageParser.height)
            {
                this._tileMap[x] = [];
                y = 0;
                while (y < gameStageMessageParser.width)
                {
                    this._tileMap[x][y] = null;
                    if (parsedHeightMap[x][y] == TILE_STATE_VOID)
                    {
                    }
                    else
                    {
                        tile = new Tile(y, x);
                        this._tileMap[x][y] = tile;
						
                        tileNE = this.getTileAt((y + 1), (x - 1));
                        if (tileNE != null)
                        {
                            tile.linkAdjacentTile(tileNE, Direction8.NE);
                        }
						
                        tileN = this.getTileAt(y, (x - 1));
                        if (tileN != null)
                        {
                            tile.linkAdjacentTile(tileN, Direction8.N);
                        }
						
                        tileNW = this.getTileAt((y - 1), (x - 1));
                        if (tileNW != null)
                        {
                            tile.linkAdjacentTile(tileNW, Direction8.NW);
                        }
						
                        tileW = this.getTileAt((y - 1), x);
                        if (tileW != null)
                        {
                            tile.linkAdjacentTile(tileW, Direction8.W);
                        }
                    }
                    y++;
                }
                x++;
            }
        }

        public function tileMap():Array
        {
            return this._tileMap;
        }

        public function hasCollision(object:_SafeStr_4030):Boolean
        {
            if (object.location3D.z < 1)
            {
                return true;
            }
            var x:int = Tile.fromLocationX(object.location3D.x);
            var y:int = Tile.fromLocationY(object.location3D.y);
            var tile:Tile = this.getTileAt(x, y);
            if (tile)
            {
                return object.location3D.z < tile.height;
            }
            return false;
        }

        public function _SafeStr_18866(x:int, y:int):Boolean
        {
            var newX:int = Tile.fromLocationX(x);
            var newY:int = Tile.fromLocationY(y);
            var tile:Tile = this.getTileAt(newX, newY);
            if (tile)
            {
                return tile.walkable(null);
            }
            return false;
        }

        public function getTileAt(x:int, y:int):Tile
        {
            if (((((x < 0) || (x >= this._tileMap[0].length)) || (y < 0)) || (y >= this._tileMap.length)))
            {
                return null;
            }
            return this._tileMap[y][x];
        }

        private function parseHeightMap(modelData:String, width:int, height:int):Array
        {
            var row:String;
            var y:int;
            var tileCharacter:String;
            var tileValue:int;
            var highestTile:int;
            var modelRows:Array = modelData.split("\r");
            var heightmap:Array = new Array();
            var x:int;
            while (x < modelRows.length)
            {
                row = modelRows[x];
                heightmap[x] = [];
                y = (row.length - 1);
                while (y >= 0)
                {
                    tileCharacter = row.charAt(y);
                    tileValue = parseInt(tileCharacter);
                    if (!isNaN(parseInt(tileCharacter)))
                    {
                        heightmap[x][y] = tileValue;
                    }
                    else
                    {
                        if (tileCharacter == "x")
                        {
                            heightmap[x][y] = TILE_STATE_VOID;
                        }
                        else
                        {
                            heightmap[x][y] = (10 + (tileCharacter.charCodeAt(0) - "a".charCodeAt(0)));
                        }
                    }
					
					//Probably obselete.
                    if (((heightmap[x][y] > highestTile) && (!(heightmap[x][y] == TILE_STATE_VOID))))
                    {
                        highestTile = heightmap[x][y];
                    }
					
                    y--;
                }
                x++;
            }
            return heightmap;
        }

        public function removeGameObjects():void
        {
            var x:int;
            var y:int;
            var tile:Tile;
            if (((this._tileMap) && (this._tileMap.length > 0)))
            {
                x = 0;
                while (x < this._tileMap.length)
                {
                    y = 0;
                    while (y < (this._tileMap[0] as Array).length)
                    {
                        tile = this._tileMap[x][y];
                        if (tile)
                        {
                            tile.removeGameObject();
                        }
                        y++;
                    }
                    x++;
                }
            }
        }
    }
}
