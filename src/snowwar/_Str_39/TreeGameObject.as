package snowwar._Str_39
{
    import snowwar.Tile;
    import snowwar._Str_254.Direction8;
    import snowwar._Str_254.Direction360;
    import snowwar._Str_62._SafeStr_3584;
    import snowwar.SnowWarGameStage;
    import snowwar._Str_62.SnowWarGameObjectData;
	import com.sulake.core.runtime.exceptions.Exception;
    import snowwar._Str_254.CollisionDetection;
    import snowwar._Str_231.SynchronizedGameStage;
    import snowwar._Str_254.Location;

    public class TreeGameObject extends SnowWarGameObject 
    {
        private static const _SafeStr_22083:Array = [0];
        private static const _SafeStr_18823:Array = [((Tile.COST - _SafeStr_4035._SafeStr_18823[0]) - 1)];

        private var _SafeStr_22070:int;
        private var _SafeStr_22082:Tile;
        private var _direction8:Direction8;
        private var _direction360:Direction360;
        private var _height:int;
        private var _maximumHits:int;
        private var _hits:int;

        public function TreeGameObject(k:_SafeStr_3584, _arg_2:SnowWarGameStage)
        {
            super(k.id, false);
            isActive = true;
            this._SafeStr_22082 = _arg_2.getTileAt(Tile.fromLocationX(k.x), Tile.fromLocationY(k.y));
            this._direction8 = Direction8.fromIndex(k.direction);
            this._direction360 = new Direction360(Direction360.direction8ToDirection360Value(this._direction8));
            this._SafeStr_22070 = k._SafeStr_18032;
            this._height = k.height;
            this._hits = k.hits;
            this._maximumHits = k.maximumHits;
            if (this._hits < this._maximumHits)
            {
                _arg_2.addSnowWarGameObject(this);
            }
            this._SafeStr_22082.addHeight(-(this._height));
            this._SafeStr_22082.blocked = true;
        }

        override public function get numberOfVariables():int
        {
            return _SafeStr_3584.NUM_OF_VARIABLES;
        }

        override public function getVariable(k:int):int
        {
            switch (k)
            {
                case 0:
                    return SnowWarGameObjectData.OBJECT_TYPE_TREE;
                case 1:
                    return _SafeStr_13236;
                case 2:
                    return this._SafeStr_22082.location.x;
                case 3:
                    return this._SafeStr_22082.location.y;
                case 4:
                    return this._direction8.index();
                case 5:
                    return this._height;
                case 6:
                    return this._SafeStr_22070;
                case 7:
                    return this._maximumHits;
                case 8:
                    return this._hits;
            }
            throw (new Exception(("No such variable:" + k)));
        }

        override public function get boundingType():int
        {
            return CollisionDetection._SafeStr_18853;
        }

        override public function subturn(k:SynchronizedGameStage):void
        {
        }

        override public function get boundingData():Array
        {
            if (this._hits < this._maximumHits)
            {
                return _SafeStr_18823;
            }
            return _SafeStr_22083;
        }

        override public function get location3D():Location
        {
            return this._SafeStr_22082.location;
        }

        override public function get direction360():Direction360
        {
            return this._direction360;
        }

        override public function onSnowBallHit(k:SnowWarGameStage, _arg_2:_SafeStr_4035):void
        {
            if (this._hits < this._maximumHits)
            {
                this._hits++;
            }
            if (this._hits >= this._maximumHits)
            {
                this._SafeStr_22082.removeGameObject();
            }
        }

        public function get _SafeStr_18033():int
        {
            return this._maximumHits;
        }

        public function get hits():int
        {
            return this._hits;
        }

        public function get _SafeStr_18032():int
        {
            return this._SafeStr_22070;
        }

        override public function get collisionHeight():int
        {
            return this._height;
        }
    }
}
