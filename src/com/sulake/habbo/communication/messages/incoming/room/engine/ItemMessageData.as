package com.sulake.habbo.communication.messages.incoming.room.engine
{
    public class ItemMessageData
    {
        private var _id:int = 0;
        private var _isOldFormat:Boolean = false;
        private var _wallX:int = 0;
        private var _wallY:int = 0;
        private var _localX:int = 0;
        private var _localY:int = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:String = "";
        private var _type:int = 0;
        private var _state:int = 0;
        private var _data:String = "";
        private var _isReadOnly:Boolean = false;
        private var _usagePolicy:int = 0;
        private var _ownerId:int = 0;
        private var _ownerName:String = "";
        private var _secondsToExpiration:int;

        public function ItemMessageData(k:int, _arg_2:int, _arg_3:Boolean)
        {
            this._id = k;
            this._type = _arg_2;
            this._isOldFormat = _arg_3;
        }

        public function setReadOnly():void
        {
            this._isReadOnly = true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get isOldFormat():Boolean
        {
            return this._isOldFormat;
        }

        public function get wallX():Number
        {
            return this._wallX;
        }

        public function set wallX(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._wallX = k;
            }
        }

        public function get wallY():Number
        {
            return this._wallY;
        }

        public function set wallY(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._wallY = k;
            }
        }

        public function get localX():Number
        {
            return this._localX;
        }

        public function set localX(k:Number):void
        {
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
            {
                this._data = k;
            }
        }

        public function get usagePolicy():int
        {
            return this._usagePolicy;
        }

        public function set usagePolicy(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._usagePolicy = k;
            }
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerId(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._ownerId = k;
            }
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            if (!this._isReadOnly)
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
            if (!this._isReadOnly)
            {
                this._secondsToExpiration = k;
            }
        }
    }
}
