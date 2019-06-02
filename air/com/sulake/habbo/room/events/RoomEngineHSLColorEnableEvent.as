//com.sulake.habbo.room.events.RoomEngineHSLColorEnableEvent

package com.sulake.habbo.room.events{
    public class RoomEngineHSLColorEnableEvent extends RoomEngineEvent {

        public static const ROOM_BACKGROUND_COLOR:String;

        private var _enable:Boolean;
        private var _hue:int;
        private var _saturation:int;
        private var _lightness:int;

        public function RoomEngineHSLColorEnableEvent(k:String, _arg_2:int, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get enable():Boolean;

        public function get hue():int;

        public function get saturation():int;

        public function get lightness():int;


    }
}//package com.sulake.habbo.room.events

