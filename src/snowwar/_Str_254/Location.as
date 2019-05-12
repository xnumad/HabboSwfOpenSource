package snowwar._Str_254
{
	import com.sulake.core.runtime.IDisposable;

    public class Location implements IDisposable //_SafeStr_4026
    {
        private var _x:int;
        private var _y:int;
        private var _z:int;
        private var _disposed:Boolean = false;

        public function Location(x:int, y:int, z:int)
        {
            this._x = x;
            this._y = y;
            this._z = z;
        }

        public static function _SafeStr_18786(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            var _local_6:int = (_arg_3 - k);
            if (_local_6 < 0)
            {
                _local_6 = -(_local_6);
            }
            var _local_7:int = (_arg_4 - _arg_2);
            if (_local_7 < 0)
            {
                _local_7 = -(_local_7);
            }
            if (((_local_7 > _arg_5) || (_local_6 > _arg_5)))
            {
                return false;
            }
            if (((_local_6 * _local_6) + (_local_7 * _local_7)) < (_arg_5 * _arg_5))
            {
                return true;
            }
            return false;
        }

        public function dispose():void
        {
            this._x = 0;
            this._y = 0;
            this._z = 0;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get z():int
        {
            return this._z;
        }

        public function setLocation(x:int, y:int, z:int):void //_SafeStr_18787
        {
            this._x = x;
            this._y = y;
            this._z = z;
        }

        public function setPosition(x:int, y:int):void //_SafeStr_18788
        {
            this._x = x;
            this._y = y;
        }

        public function fromLocation(location:Location):void //_SafeStr_18789
        {
            this._x = location._x;
            this._y = location._y;
            this._z = location._z;
        }

        public function distanceTo(location:Location):int
        {
            var dX:int = (location._x - this._x);
            var dY:int = (location._y - this._y);
            var dZ:int = (location._z - this._z);
            return (Math.abs(dX) + Math.abs(dY)) + Math.abs(dZ);
        }

        public function directionTo(location:Location):Direction8
        {
            if (((location._x == this._x) && (location._y == this._y)))
            {
                return null;
            }
            var dX:int = (location._x - this._x);
            var dY:int = (location._y - this._y);
            var rotation:int = Direction360._SafeStr_18792(dX, dY);
            return Direction360.direction360ValueToDirection8(rotation);
        }

        public function equalLocation(object:Object):Boolean //_SafeStr_6265
        {
            if (this == object)
            {
                return true;
            }
            if (!(object is Location))
            {
                return false;
            }
            var location:Location = Location(object);
			return this._x == location._x && this._y == location._y && this._z == location._z;
			
            /* Old. Before refactored.
			 * if (this._x != location._x)
            {
                return false;
            }
            if (this._y != location._y)
            {
                return false;
            }
            if (this._z != location._z)
            {
                return false;
            }
            return true;*/
        }

        public function _SafeStr_18790():int //Probably hashcode just like Direction8._SafeStr_18790
        {
            var k:int;
            k = this._x;
            k = ((29 * k) + this._y);
            k = ((29 * k) + this._z);
            return k;
        }

        public function toString():String
        {
            return (((("_x:" + this._x) + "yy:") + this._y) + "_zz:") + this._z;
        }

        public function _SafeStr_18791(k:Location, _arg_2:int):Boolean
        {
            return _SafeStr_18786(this._x, this._y, k._x, k._y, _arg_2);
        }
    }
}
