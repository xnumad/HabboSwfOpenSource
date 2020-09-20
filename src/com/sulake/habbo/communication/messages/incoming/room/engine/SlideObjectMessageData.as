package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.room.utils.Vector3d;

    public class SlideObjectMessageData
    {
        public static const MV:String = "mv";
        public static const SLD:String = "sld";

        private var _id:int = 0;
        private var _loc:Vector3d;
        private var _target:Vector3d;
        private var _moveType:String;
        private var _isReadOnly:Boolean = false;

        public function SlideObjectMessageData(k:int, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:String=null)
        {
            this._id = k;
            this._loc = _arg_2;
            this._target = _arg_3;
            this._moveType = _arg_4;
        }

        public function setReadOnly():void
        {
            this._isReadOnly = true;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get loc():Vector3d
        {
            return this._loc;
        }

        public function set loc(k:Vector3d):void
        {
            if (!this._isReadOnly)
            {
                this._loc = k;
            }
        }

        public function get target():Vector3d
        {
            return this._target;
        }

        public function set target(k:Vector3d):void
        {
            if (!this._isReadOnly)
            {
                this._target = k;
            }
        }

        public function get _Str_21300():String
        {
            return this._moveType;
        }

        public function set _Str_21300(k:String):void
        {
            if (!this._isReadOnly)
            {
                this._moveType = k;
            }
        }
    }
}
