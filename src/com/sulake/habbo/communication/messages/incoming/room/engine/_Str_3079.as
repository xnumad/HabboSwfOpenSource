package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class _Str_3079 
    {
        private var _id:int = 0;
        private var _Str_19875:Boolean = false;
        private var _Str_21211:int = 0;
        private var _Str_19818:int = 0;
        private var _localX:int = 0;
        private var _localY:int = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:String = "";
        private var _type:int = 0;
        private var _state:int = 0;
        private var _data:String = "";
        private var _Str_2479:Boolean = false;
        private var _Str_5135:int = 0;
        private var _Str_2592:int = 0;
        private var _ownerName:String = "";
        private var _secondsToExpiration:int;

        public function _Str_3079(k:int, _arg_2:int, _arg_3:Boolean)
        {
            this._id = k;
            this._type = _arg_2;
            this._Str_19875 = _arg_3;
        }

        public function _Str_4710():void
        {
            this._Str_2479 = true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get _Str_22379():Boolean
        {
            return this._Str_19875;
        }

        public function get _Str_15139():Number
        {
            return this._Str_21211;
        }

        public function set _Str_15139(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._Str_21211 = k;
            }
        }

        public function get _Str_15569():Number
        {
            return this._Str_19818;
        }

        public function set _Str_15569(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._Str_19818 = k;
            }
        }

        public function get localX():Number
        {
            return this._localX;
        }

        public function set localX(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._localX = k;
            }
        }

        public function get localY():Number
        {
            return this._localY;
        }

        public function set localY(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._localY = k;
            }
        }

        public function get y():Number
        {
            return this._y;
        }

        public function set y(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._y = k;
            }
        }

        public function get z():Number
        {
            return this._z;
        }

        public function set z(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._z = k;
            }
        }

        public function get dir():String
        {
            return this._dir;
        }

        public function set dir(k:String):void
        {
            if (!this._Str_2479)
            {
                this._dir = k;
            }
        }

        public function get type():int
        {
            return this._type;
        }

        public function set type(k:int):void
        {
            if (!this._Str_2479)
            {
                this._type = k;
            }
        }

        public function get state():int
        {
            return this._state;
        }

        public function set state(k:int):void
        {
            if (!this._Str_2479)
            {
                this._state = k;
            }
        }

        public function get data():String
        {
            return this._data;
        }

        public function set data(k:String):void
        {
            if (!this._Str_2479)
            {
                this._data = k;
            }
        }

        public function get usagePolicy():int
        {
            return this._Str_5135;
        }

        public function set usagePolicy(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_5135 = k;
            }
        }

        public function get ownerId():int
        {
            return this._Str_2592;
        }

        public function set ownerId(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_2592 = k;
            }
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            if (!this._Str_2479)
            {
                this._ownerName = k;
            }
        }

        public function get secondsToExpiration():int
        {
            return this._secondsToExpiration;
        }

        public function set secondsToExpiration(k:int):void
        {
            if (!this._Str_2479)
            {
                this._secondsToExpiration = k;
            }
        }
    }
}
