package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3D;

    public class RoomObjectMoveUpdateMessage extends RoomObjectUpdateMessage 
    {
        private var _targetLoc:IVector3D;
        private var _isSlideUpdate:Boolean;

        public function RoomObjectMoveUpdateMessage(k:IVector3D, _arg_2:IVector3D, _arg_3:IVector3D, _arg_4:Boolean=false)
        {
            super(k, _arg_3);
            this._isSlideUpdate = _arg_4;
            this._targetLoc = _arg_2;
        }

        public function get _Str_7569():IVector3D
        {
            if (this._targetLoc == null)
            {
                return loc;
            }
            return this._targetLoc;
        }

        public function get _Str_26128():IVector3D
        {
            return this._targetLoc;
        }

        public function get _Str_24236():Boolean
        {
            return this._isSlideUpdate;
        }
    }
}
