package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.utils.IVector3d;

    public class RoomObjectMoveUpdateMessage extends RoomObjectUpdateMessage 
    {
        private var _targetLoc:IVector3d;
        private var _isSlideUpdate:Boolean;

        public function RoomObjectMoveUpdateMessage(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:Boolean=false)
        {
            super(k, _arg_3);
            this._isSlideUpdate = _arg_4;
            this._targetLoc = _arg_2;
        }

        public function get _Str_7569():IVector3d
        {
            if (this._targetLoc == null)
            {
                return loc;
            }
            return this._targetLoc;
        }

        public function get realTargetLoc():IVector3d
        {
            return this._targetLoc;
        }

        public function get isSlideUpdate():Boolean
        {
            return this._isSlideUpdate;
        }
    }
}
