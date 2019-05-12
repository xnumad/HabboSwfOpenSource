package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;
    import flash.events.Event;

    public class RoomObjectRoomAdEvent extends RoomObjectEvent 
    {
        public static const RORAE_ROOM_AD_LOAD_IMAGE:String = "RORAE_ROOM_AD_LOAD_IMAGE";
        public static const RORAE_ROOM_AD_FURNI_CLICK:String = "RORAE_ROOM_AD_FURNI_CLICK";
        public static const RORAE_ROOM_AD_FURNI_DOUBLE_CLICK:String = "RORAE_ROOM_AD_FURNI_DOUBLE_CLICK";
        public static const RORAE_ROOM_AD_TOOLTIP_SHOW:String = "RORAE_ROOM_AD_TOOLTIP_SHOW";
        public static const RORAE_ROOM_AD_TOOLTIP_HIDE:String = "RORAE_ROOM_AD_TOOLTIP_HIDE";

        private var _imageUrl:String = "";
        private var _clickUrl:String = "";

        public function RoomObjectRoomAdEvent(k:String, _arg_2:IRoomObject, _arg_3:String="", _arg_4:String="", _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(k, _arg_2, _arg_5, _arg_6);
            this._imageUrl = _arg_3;
            this._clickUrl = _arg_4;
        }

        public function get clickUrl():String
        {
            return this._clickUrl;
        }

        public function get imageUrl():String
        {
            return this._imageUrl;
        }

        override public function clone():Event
        {
            return new RoomObjectRoomAdEvent(type, object, this.imageUrl, this.clickUrl, bubbles, cancelable);
        }
    }
}
