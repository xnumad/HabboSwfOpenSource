package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage 
    {
        private var _effect:int;
        private var _delayMilliSeconds:int;

        public function RoomObjectAvatarEffectUpdateMessage(k:int=0, _arg_2:int=0)
        {
            this._effect = k;
            this._delayMilliSeconds = _arg_2;
        }

        public function get effect():int
        {
            return this._effect;
        }

        public function get delayMilliSeconds():int
        {
            return this._delayMilliSeconds;
        }
    }
}
