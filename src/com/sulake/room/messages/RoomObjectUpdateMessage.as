package com.sulake.room.messages
{
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectUpdateMessage 
    {
        protected var _loc:IVector3d;
        protected var _dir:IVector3d;

        public function RoomObjectUpdateMessage(k:IVector3d, _arg_2:IVector3d)
        {
            this._loc = k;
            this._dir = _arg_2;
        }

        public function get loc():IVector3d
        {
            return this._loc;
        }

        public function get dir():IVector3d
        {
            return this._dir;
        }
    }
}
