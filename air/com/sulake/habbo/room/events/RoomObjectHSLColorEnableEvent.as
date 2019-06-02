//com.sulake.habbo.room.events.RoomObjectHSLColorEnableEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectHSLColorEnableEvent extends RoomObjectEvent {

        public static const ROOM_BACKGROUND_COLOR:String;

        private var _enable:Boolean;
        private var _hue:int;
        private var _saturation:int;
        private var _lightness:int;

        public function RoomObjectHSLColorEnableEvent(k:String, _arg_2:IRoomObject, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false);

        public function get enable():Boolean;

        public function get hue():int;

        public function get saturation():int;

        public function get lightness():int;


    }
}//package com.sulake.habbo.room.events

