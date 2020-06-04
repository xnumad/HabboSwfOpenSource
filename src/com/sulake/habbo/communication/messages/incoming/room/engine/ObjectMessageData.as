package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data.LegacyStuffData;

    public class ObjectMessageData
    {
        private var _id:int = 0;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:int = 0;
        private var _sizeX:int = 0;
        private var _sizeY:int = 0;
        private var _sizeZ:Number = 0;
        private var _type:int = 0;
        private var _extra:int = -1;
        private var _state:int = 0;
        private var _data:IStuffData;
        private var _expiryTime:int = 0;
        private var _usagePolicy:int;
        private var _ownerId:int = 0;
        private var _ownerName:String = "";
        private var _staticClass:String = null;
        private var _isReadOnly:Boolean = false;

        public function ObjectMessageData(k:int)
        {
            this._data = new LegacyStuffData();
            super();
            this._id = k;
        }

        public function setReadOnly():void
        {
            this._isReadOnly = true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function set x(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._x = k;
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

        public function get dir():int
        {
            return this._dir;
        }

        public function set dir(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._dir = k;
            }
        }

        public function get sizeX():int
        {
            return this._sizeX;
        }

        public function set sizeX(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._sizeX = k;
            }
        }

        public function get sizeY():int
        {
            return this._sizeY;
        }

        public function set sizeY(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._sizeY = k;
            }
        }

        public function get sizeZ():Number
        {
            return this._sizeZ;
        }

        public function set sizeZ(k:Number):void
        {
            if (!this._isReadOnly)
            {
                this._sizeZ = k;
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

        public function get data():IStuffData
        {
            return this._data;
        }

        public function set data(k:IStuffData):void
        {
            if (!this._isReadOnly)
            {
                this._data = k;
            }
        }

        public function get staticClass():String
        {
            return this._staticClass;
        }

        public function set staticClass(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._staticClass = k;
            }
        }

        public function get extra():int
        {
            return this._extra;
        }

        public function set extra(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._extra = k;
            }
        }

        public function get expiryTime():int
        {
            return this._expiryTime;
        }

        public function set expiryTime(k:int):void
        {
            if (!this._isReadOnly)
            {
                this._expiryTime = k;
            }
        }

        public function get usagePolicy():int
        {
            return this._usagePolicy;
        }

        public function set usagePolicy(k:int):void
        {
            this._usagePolicy = k;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerId(k:int):void
        {
            this._ownerId = k;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            this._ownerName = k;
        }
    }
}
