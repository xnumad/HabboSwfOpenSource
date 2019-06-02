package com.sulake.habbo.room.utils
{
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.room.utils.IVector3d;

    public class SelectedRoomObjectData implements ISelectedRoomObjectData 
    {
        private var _id:int = 0;
        private var _category:int = 0;
        private var _operation:String = "";
        private var _loc:Vector3d = null;
        private var _dir:Vector3d = null;
        private var _typeId:int = 0;
        private var _instanceData:String = null;
        private var _stuffData:IStuffData = null;
        private var _state:int = -1;
        private var _animFrame:int = -1;
        private var _posture:String = null;

        public function SelectedRoomObjectData(k:int, _arg_2:int, _arg_3:String, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null)
        {
            this._id = k;
            this._category = _arg_2;
            this._operation = _arg_3;
            this._loc = new Vector3d();
            this._loc.assign(_arg_4);
            this._dir = new Vector3d();
            this._dir.assign(_arg_5);
            this._typeId = _arg_6;
            this._instanceData = _arg_7;
            this._stuffData = _arg_8;
            this._state = _arg_9;
            this._animFrame = _arg_10;
            this._posture = _arg_11;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get operation():String
        {
            return this._operation;
        }

        public function get loc():Vector3d
        {
            return this._loc;
        }

        public function get dir():Vector3d
        {
            return this._dir;
        }

        public function get typeId():int
        {
            return this._typeId;
        }

        public function get _Str_4766():String
        {
            return this._instanceData;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function get state():int
        {
            return this._state;
        }

        public function get _Str_15896():int
        {
            return this._animFrame;
        }

        public function get posture():String
        {
            return this._posture;
        }

        public function dispose():void
        {
            this._loc = null;
            this._dir = null;
        }
    }
}
