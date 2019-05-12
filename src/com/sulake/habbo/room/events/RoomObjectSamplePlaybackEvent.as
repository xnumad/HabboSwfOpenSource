package com.sulake.habbo.room.events
{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectSamplePlaybackEvent extends RoomObjectFurnitureActionEvent 
    {
        public static const ROPSPE_ROOM_OBJECT_INITIALIZED:String = "ROPSPE_ROOM_OBJECT_INITIALIZED";
        public static const ROPSPE_ROOM_OBJECT_DISPOSED:String = "ROPSPE_ROOM_OBJECT_DISPOSED";
        public static const ROPSPE_PLAY_SAMPLE:String = "ROPSPE_PLAY_SAMPLE";
        public static const ROPSPE_CHANGE_PITCH:String = "ROPSPE_CHANGE_PITCH";

        private var _sampleId:int;
        private var _pitch:Number;

        public function RoomObjectSamplePlaybackEvent(k:String, _arg_2:IRoomObject, _arg_3:int, _arg_4:Number=1, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_2, _arg_5, _arg_6);
            this._sampleId = _arg_3;
            this._pitch = _arg_4;
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
