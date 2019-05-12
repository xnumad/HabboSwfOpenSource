package com.sulake.habbo.room.messages
{
    import com.sulake.room.utils.IVector3D;

    public class RoomObjectAvatarUpdateMessage extends RoomObjectMoveUpdateMessage 
    {
        private var _dirHead:int;
        private var _canStandUp:Boolean;
        private var _baseY:Number;

        public function RoomObjectAvatarUpdateMessage(k:IVector3D, _arg_2:IVector3D, _arg_3:IVector3D, _arg_4:int, _arg_5:Boolean, _arg_6:Number)
        {
            super(k, _arg_2, _arg_3);
            this._dirHead = _arg_4;
            this._canStandUp = _arg_5;
            this._baseY = _arg_6;
        }

        public function get _Str_14280():int
        {
            return this._dirHead;
        }

        public function get _Str_10289():Boolean
        {
            return this._canStandUp;
        }

        public function get _Str_23070():Number
        {
            return this._baseY;
        }
    }
}
