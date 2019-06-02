//com.sulake.habbo.room.events.RoomEngineDimmerStateEvent

package com.sulake.habbo.room.events{
    public class RoomEngineDimmerStateEvent extends RoomEngineEvent {

        public static const DIMMER_STATE:String;

        private var _state:int;
        private var _presetId:int;
        private var _effectId:int;
        private var _color:uint;
        private var _brightness:int;

        public function RoomEngineDimmerStateEvent(k:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint, _arg_6:uint, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get state():int;

        public function get presetId():int;

        public function get effectId():int;

        public function get color():uint;

        public function get brightness():uint;


    }
}//package com.sulake.habbo.room.events

