package com.sulake.habbo.room.events
{
    public class RoomEngineObjectSamplePlaybackEvent extends RoomEngineObjectEvent 
    {
        public static const REOSPE_ROOM_OBJECT_INITIALIZED:String = "REOSPE_ROOM_OBJECT_INITIALIZED";
        public static const REOSPE_ROOM_OBJECT_DISPOSED:String = "REOSPE_ROOM_OBJECT_DISPOSED";
        public static const REOSPE_PLAY_SAMPLE:String = "REOSPE_PLAY_SAMPLE";
        public static const REOSPE_CHANGE_PITCH:String = "REOSPE_CHANGE_PITCH";

        private var _sampleId:int;
        private var _pitch:Number;

        public function RoomEngineObjectSamplePlaybackEvent(k:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Number=1, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._sampleId = _arg_5;
            this._pitch = _arg_6;
        }

        public function get _Str_6992():int
        {
            return this._sampleId;
        }

        public function get _Str_4740():Number
        {
            return this._pitch;
        }
    }
}
