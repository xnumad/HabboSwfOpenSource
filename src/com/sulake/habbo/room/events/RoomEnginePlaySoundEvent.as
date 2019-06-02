package com.sulake.habbo.room.events
{
    public class RoomEnginePlaySoundEvent extends RoomEngineObjectEvent 
    {
        public static const PLAY_SOUND:String = "REPSE_PLAY_SOUND";
        public static const PLAY_SOUND_AT_PITCH:String = "REPSE_PLAY_SOUND_AT_PITCH";

        private var _Str_11691:String;
        private var _Str_3759:Number;

        public function RoomEnginePlaySoundEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Number=1, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._Str_11691 = _arg_5;
            this._Str_3759 = _arg_6;
        }

        public function get soundId():String
        {
            return this._Str_11691;
        }

        public function get _Str_4740():Number
        {
            return this._Str_3759;
        }
    }
}
