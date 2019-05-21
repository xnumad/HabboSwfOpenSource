package com.sulake.room.messages
{
    import com.sulake.room.utils.IVector3D;

    public class RoomObjectUpdateMessage 
    {
        protected var _loc:IVector3D;
        protected var _dir:IVector3D;

        public function RoomObjectUpdateMessage(k:IVector3D, _arg_2:IVector3D)
        {
            this._loc = k;
            this._dir = _arg_2;
        }

        public function get loc():IVector3D
        {
            return this._loc;
        }

        public function get dir():IVector3D
        {
            return this._dir;
        }
    }
}
