package com.sulake.room.messages
{
    import com.sulake.room.utils.IVector3D;

    public class RoomObjectUpdateMessage 
    {
        protected var _Str_2416:IVector3D;
        protected var _Str_2589:IVector3D;

        public function RoomObjectUpdateMessage(k:IVector3D, _arg_2:IVector3D)
        {
            this._Str_2416 = k;
            this._Str_2589 = _arg_2;
        }

        public function get loc():IVector3D
        {
            return this._Str_2416;
        }

        public function get dir():IVector3D
        {
            return this._Str_2589;
        }
    }
}
