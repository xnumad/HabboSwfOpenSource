package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data.LegacyStuffData;

    public class _Str_3292 
    {
        private var _id:int = 0;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
        private var _dir:int = 0;
        private var _Str_3283:int = 0;
        private var _Str_3135:int = 0;
        private var _Str_5445:Number = 0;
        private var _type:int = 0;
        private var _Str_3182:int = -1;
        private var _state:int = 0;
        private var _data:IStuffData;
        private var _Str_6673:int = 0;
        private var _Str_5135:int;
        private var _Str_2592:int = 0;
        private var _ownerName:String = "";
        private var _Str_21695:String = null;
        private var _Str_2479:Boolean = false;

        public function _Str_3292(k:int)
        {
            this._data = new LegacyStuffData();
            super();
            this._id = k;
        }

        public function _Str_4710():void
        {
            this._Str_2479 = true;
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
            if (!this._Str_2479)
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

        public function get dir():int
        {
            return this._dir;
        }

        public function set dir(k:int):void
        {
            if (!this._Str_2479)
            {
                this._dir = k;
            }
        }

        public function get _Str_13204():int
        {
            return this._Str_3283;
        }

        public function set _Str_13204(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_3283 = k;
            }
        }

        public function get _Str_15185():int
        {
            return this._Str_3135;
        }

        public function set _Str_15185(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_3135 = k;
            }
        }

        public function get sizeZ():Number
        {
            return this._Str_5445;
        }

        public function set sizeZ(k:Number):void
        {
            if (!this._Str_2479)
            {
                this._Str_5445 = k;
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

        public function get data():IStuffData
        {
            return this._data;
        }

        public function set data(k:IStuffData):void
        {
            if (!this._Str_2479)
            {
                this._data = k;
            }
        }

        public function get _Str_13150():String
        {
            return this._Str_21695;
        }

        public function set _Str_13150(k:String):void
        {
            if (!this._Str_2479)
            {
                this._Str_21695 = k;
            }
        }

        public function get _Str_2794():int
        {
            return this._Str_3182;
        }

        public function set _Str_2794(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_3182 = k;
            }
        }

        public function get expiryTime():int
        {
            return this._Str_6673;
        }

        public function set expiryTime(k:int):void
        {
            if (!this._Str_2479)
            {
                this._Str_6673 = k;
            }
        }

        public function get usagePolicy():int
        {
            return this._Str_5135;
        }

        public function set usagePolicy(k:int):void
        {
            this._Str_5135 = k;
        }

        public function get ownerId():int
        {
            return this._Str_2592;
        }

        public function set ownerId(k:int):void
        {
            this._Str_2592 = k;
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
