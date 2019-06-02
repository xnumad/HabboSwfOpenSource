//com.sulake.habbo.room.events.RoomObjectRoomAdEvent

package com.sulake.habbo.room.events{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;

    public class RoomObjectRoomAdEvent extends RoomObjectEvent {

        public static const ROOM_AD_LOAD_IMAGE:String;
        public static const ROOM_AD_FURNI_CLICK:String;
        public static const ROOM_AD_FURNI_DOUBLE_CLICK:String;
        public static const ROOM_AD_TOOLTIP_SHOW:String;
        public static const ROOM_AD_TOOLTIP_HIDE:String;

        private var _imageUrl:String;
        private var _clickUrl:String;
        private var _maxImageDimension:int;

        public function RoomObjectRoomAdEvent(k:String, _arg_2:IRoomObject, _arg_3:String="", _arg_4:String="", _arg_5:int=-1, _arg_6:Boolean=false, _arg_7:Boolean=false);

        public function get clickUrl():String;

        public function get imageUrl():String;

        public function get maxImageDimension():int;

        override public function clone():Event;


    }
}//package com.sulake.habbo.room.events

