package snowwar._Str_39
{
	import com.sulake.habbo.sound.HabboSoundConstants;
	import com.sulake.core.runtime.exceptions.Exception;
	import snowwar._Str_231.SynchronizedGameStage;
	import snowwar._Str_254.CollisionDetection;
	import snowwar._Str_254.Direction360;
	import snowwar._Str_254.Direction8;
	import snowwar._Str_254.Location;
	import snowwar._Str_254.SquareRoot;
	import snowwar._Str_254._SafeStr_4667;
	import snowwar.SnowWarGameStage;
	import snowwar.Tile;
	import snowwar.SnowWarEngine;
	import snowwar._Str_62.SnowWarGameObjectData;
	import snowwar._Str_62._SafeStr_3587;

    public class _SafeStr_4035 extends SnowWarGameObject //Snowball
    {
        public static const _SafeStr_13247:int = 0;
        public static const _SafeStr_13245:int = 1;
        public static const _SafeStr_13243:int = 2;
        public static const _SafeStr_13249:int = 3;
        public static const _SafeStr_19020:int = 2000;
        public static const _SafeStr_19021:int = 3000;
        public static const _SafeStr_19022:Number = ((2 / 1.414) / _SafeStr_19020);//0.000707213578500707
        public static const _SafeStr_19023:Number = ((2.236 / 2) / _SafeStr_19020);//0.000559
        public static const _SafeStr_19024:int = 20000;
        public static const _SafeStr_19025:int = 60000;
        public static const _SafeStr_19026:int = 100000;
        public static const _SafeStr_19027:int = 42000;
        public static const _SafeStr_19028:int = 10;
        public static const _SafeStr_19029:int = 25;
        public static const _SafeStr_19030:int = 50;
        public static var _SafeStr_18823:Array = [400];
        public static const _SafeStr_19031:int = 3;
        public static const _SafeStr_19032:int = 15;

        private var _location:Location;
        private var _direction:Direction360;
        private var _SafeStr_19035:int;
        private var _SafeStr_19036:int;
        private var _ttl:int;
        private var _humanGameObject:HumanGameObject;
        private var _paraOffs:int;

        public function _SafeStr_4035(k:int)
        {
            this._location = new Location(0, 0, 0);
            this._direction = new Direction360(0);
            super(k, false);
        }

        override public function dispose():void
        {
            super.dispose();
            this._location.dispose();
            this._location = null;
            this._direction.dispose();
            this._direction = null;
            this._SafeStr_19035 = 0;
            this._SafeStr_19036 = 0;
            this._ttl = 0;
            this._humanGameObject = null;
            this._paraOffs = 0;
        }

        public function _SafeStr_18982(k:_SafeStr_3587, _arg_2:HumanGameObject):void
        {
            this._location.setLocation(k.x, k.y, k._SafeStr_18036);
            this._direction._SafeStr_19043(k._SafeStr_18037);
            this._SafeStr_19035 = k._SafeStr_18038;
            this._SafeStr_19036 = k._SafeStr_18042;
            this._ttl = k._SafeStr_18039;
            this._humanGameObject = _arg_2;
            this._paraOffs = k._SafeStr_18041;
            _active = true;
        }

        public function initialize(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:HumanGameObject):void
        {
            var _local_8:int;
            _active = true;
            this._location.setLocation(k, _arg_2, _arg_3);
            this._SafeStr_19035 = _arg_4;
            var deltaX:int = (_arg_5 - k);
            var deltaY:int = (_arg_6 - _arg_2);
            deltaX = _SafeStr_4667._SafeStr_18698((deltaX / 200));
            deltaY = _SafeStr_4667._SafeStr_18698((deltaY / 200));
            this._direction._SafeStr_19043(Direction360._SafeStr_18792(deltaX, deltaY));
            _local_8 = (SquareRoot._SafeStr_19044(((deltaX * deltaX) + (deltaY * deltaY))) * 200);
            this._SafeStr_19040(_arg_4, _local_8);
            if (this._SafeStr_19035 == _SafeStr_13247)
            {
                this._ttl = (_SafeStr_19024 / _SafeStr_19020);
                this._SafeStr_19036 = _SafeStr_19020;
            }
            else
            {
                if (this._SafeStr_19035 == _SafeStr_13245)
                {
                    _local_8 = Math.min(_local_8, _SafeStr_19025);
                    this._ttl = (_local_8 * _SafeStr_19023);
                    this._SafeStr_19036 = ((this._ttl == 0) ? 0 : _SafeStr_4667._SafeStr_18698((_local_8 / this._ttl)));
                }
                else
                {
                    if (this._SafeStr_19035 == _SafeStr_13243)
                    {
                        _local_8 = Math.min(_local_8, _SafeStr_19026);
                        this._ttl = (_local_8 * _SafeStr_19022);
                        this._SafeStr_19036 = ((this._ttl == 0) ? 0 : _SafeStr_4667._SafeStr_18698((_local_8 / this._ttl)));
                    }
                }
            }
            this._paraOffs = _SafeStr_4667._SafeStr_18698((this._ttl / 2));
            this._humanGameObject = _arg_7;
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((((((((((((("Snowball created, id=" + _id) + " ttl:") + this._ttl) + " deltaX:") + deltaX) + " deltaY:") + deltaY) + " deltaX/200:") + _SafeStr_4667._SafeStr_18698((deltaX / 200))) + " deltaY/200:") + _SafeStr_4667._SafeStr_18698((deltaY / 200))) + " deltax^2+deltay^2:") + ((deltaX * deltaX) + (deltaY * deltaY))) + " sqrt(deltax^2+deltay^2):") + SquareRoot._SafeStr_19044(((deltaX * deltaX) + (deltaY * deltaY)))) + " sqrt(deltax^2+deltay^2)*200:") + (SquareRoot._SafeStr_19044(((deltaX * deltaX) + (deltaY * deltaY))) * 200)));
            }
        }

        private function _SafeStr_19040(k:int, _arg_2:int):void
        {
            if (k == _SafeStr_13249)
            {
                if (_arg_2 <= _SafeStr_19027)
                {
                    this._SafeStr_19035 = _SafeStr_13247;
                }
                else
                {
                    if (_arg_2 <= _SafeStr_19025)
                    {
                        this._SafeStr_19035 = _SafeStr_13245;
                    }
                    else
                    {
                        this._SafeStr_19035 = _SafeStr_13243;
                    }
                }
            }
            else
            {
                this._SafeStr_19035 = k;
            }
        }

        override public function get numberOfVariables():int
        {
            return _SafeStr_3587.NUM_OF_VARIABLES;
        }

        override public function getVariable(k:int):int
        {
            switch (k)
            {
                case 0:
                    return SnowWarGameObjectData.OBJECT_TYPE_SNOWBALL;
                case 1:
                    return _id;
                case 2:
                    return this._location.x;
                case 3:
                    return this._location.y;
                case 4:
                    return this._location.z;
                case 5:
                    return this._direction.index();
                case 6:
                    return this._SafeStr_19035;
                case 7:
                    return this._ttl;
                case 8:
                    return (this._humanGameObject == null) ? -1 : this._humanGameObject._SafeStr_13236;
                case 9:
                    return this._paraOffs;
                case 10:
                    return this._SafeStr_19036;
            }
            throw (new Exception(("No such variable:" + k)));
        }

        override public function get direction360():Direction360
        {
            return this._direction;
        }

        override public function get boundingType():int
        {
            return CollisionDetection._SafeStr_18853;
        }

        override public function get boundingData():Array
        {
            return _SafeStr_18823;
        }

        override public function get location3D():Location
        {
            return this._location;
        }

        override public function subturn(k:SynchronizedGameStage):void
        {
            var _local_2:SnowWarGameStage = (k as SnowWarGameStage);
            if (!_active)
            {
                return;
            }
            this._ttl--;
            if (this._SafeStr_19035 == _SafeStr_13247)
            {
                this._SafeStr_12603(_SafeStr_19028, true);
            }
            else
            {
                if (this._SafeStr_19035 == _SafeStr_13245)
                {
                    this._SafeStr_12603(_SafeStr_19029, false);
                }
                else
                {
                    this._SafeStr_12603(_SafeStr_19030, false);
                }
            }
            var tileX:int = Tile.fromLocationX(this._location.x);
            var tileY:int = Tile.fromLocationY(this._location.y);
            var _local_5:Tile = _local_2.getTileAt(tileX, tileY);
            var collision:Boolean = this._SafeStr_19041(_local_2, _local_5);
            if (!collision)
            {
                collision = _local_2.hasCollision(this);
                if (collision)
                {
                    SnowWarEngine._Str_4375(HabboSoundConstants.GAMES_SW_MISS);
                }
            }
            if (collision)
            {
                _local_2._SafeStr_18710(this);
            }
            if (HabboGamesCom.logEnabled)
            {
                HabboGamesCom.log(((((((("Snowball " + _id) + " tileX:") + tileX) + " tileY:") + tileY) + " collision:") + collision));
            }
        }

        private function _SafeStr_19041(k:SnowWarGameStage, _arg_2:Tile):Boolean
        {
            var _local_4:Direction8;
            var _local_3:Boolean;
            if (_arg_2)
            {
                _local_3 = this._SafeStr_19042(k, _arg_2);
                if (!_local_3)
                {
                    _local_4 = this._direction.direction8Value();
                    _local_3 = this._SafeStr_19042(k, _arg_2.adjacentTile(_local_4));
                    if (!_local_3)
                    {
                        _local_3 = this._SafeStr_19042(k, _arg_2.adjacentTile(_local_4.rotateDirection45Degrees(false)));
                        if (!_local_3)
                        {
                            _local_3 = this._SafeStr_19042(k, _arg_2.adjacentTile(_local_4.rotateDirection45Degrees(true)));
                        }
                    }
                }
            }
            return _local_3;
        }

        private function _SafeStr_19042(k:SnowWarGameStage, _arg_2:Tile):Boolean
        {
            var _local_3:SnowWarGameObject;
            if (_arg_2)
            {
                _local_3 = _arg_2.gameObject;
                if (_local_3)
                {
                    if (HabboGamesCom.logEnabled)
                    {
                        HabboGamesCom.log(((("Snowball " + _id) + " testing collision with ") + _local_3._SafeStr_13236));
                    }
                    if (_local_3.testSnowBallCollision(this))
                    {
                        _local_3.onSnowBallHit(k, this);
                        return true;
                    }
                }
            }
            return false;
        }

        private function _SafeStr_12603(k:int, _arg_2:Boolean):void
        {
            var _local_3:int = (this._location.x + _SafeStr_4667._SafeStr_18698(((this._direction._SafeStr_19045() * this._SafeStr_19036) / 0xFF)));
            var _local_4:int = (this._location.y + _SafeStr_4667._SafeStr_18698(((this._direction._SafeStr_19046() * this._SafeStr_19036) / 0xFF)));
            var _local_5:int = (this._ttl - this._paraOffs);
            var _local_6:int = ((((this._paraOffs * this._paraOffs) - (_local_5 * _local_5)) * k) + _SafeStr_19021);
            if (_arg_2)
            {
                _local_6 = Math.min(_local_6, _SafeStr_19021);
            }
            this._location.setLocation(_local_3, _local_4, _local_6);
        }

        override public function onSnowBallHit(k:SnowWarGameStage, _arg_2:_SafeStr_4035):void
        {
        }

        public function toString():String
        {
            return (((((((((((" location=(" + this._location.x) + ",") + this._location.y) + ",") + this._location.z) + ")") + " dir=") + this._direction) + " paraOffs=") + this._paraOffs) + " ttl=") + this._ttl;
        }

        public function get _SafeStr_18040():HumanGameObject
        {
            return this._humanGameObject;
        }
    }
}
