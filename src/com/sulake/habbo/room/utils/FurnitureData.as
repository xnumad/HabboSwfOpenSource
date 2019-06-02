package com.sulake.habbo.room.utils
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.room.utils.IVector3d;

    public class FurnitureData 
    {
        private var _id:int = 0;
        private var _typeId:int = 0;
        private var _type:String = null;
        private var _loc:Vector3d;
        private var _dir:Vector3d;
        private var _state:int = 0;
        private var _data:IStuffData = null;
        private var _extra:Number = NaN;
        private var _expiryTime:int = -1;
        private var _usagePolicy:int = 0;
        private var _ownerId:int = 0;
        private var _ownerName:String = "";
        private var _synchronized:Boolean = true;
        private var _realRoomObject:Boolean = true;
        private var _sizeZ:Number;

        public function FurnitureData(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1)
        {
            this._loc = new Vector3d();
            this._dir = new Vector3d();
            super();
            this._id = k;
            this._typeId = _arg_2;
            this._type = _arg_3;
            this._loc.assign(_arg_4);
            this._dir.assign(_arg_5);
            this._state = _arg_6;
            this._data = _arg_7;
            this._extra = _arg_8;
            this._expiryTime = _arg_9;
            this._usagePolicy = _arg_10;
            this._ownerId = _arg_11;
            this._ownerName = _arg_12;
            this._synchronized = _arg_13;
            this._realRoomObject = _arg_14;
            this._sizeZ = _arg_15;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get typeId():int
        {
            return this._typeId;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get loc():IVector3d
        {
            return this._loc;
        }

        public function get dir():IVector3d
        {
            return this._dir;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get data():IStuffData
        {
            return this._data;
        }

        public function get _Str_2794():Number
        {
            return this._extra;
        }

        public function get expiryTime():int
        {
            return this._expiryTime;
        }

        public function get usagePolicy():int
        {
            return this._usagePolicy;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function get synchronized():Boolean
        {
            return this._synchronized;
        }

        public function get realRoomObject():Boolean
        {
            return this._realRoomObject;
        }

        public function get sizeZ():Number
        {
            return this._sizeZ;
        }
    }
}
