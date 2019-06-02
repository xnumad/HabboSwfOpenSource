//com.sulake.habbo.toolbar.events.HabboToolbarEvent

package com.sulake.habbo.toolbar.events{
    import flash.events.Event;

    public class HabboToolbarEvent extends Event {

        public static const TOOLBAR_CLICK:String;
        public static const GROUP_ROOM_INFO_CLICK:String;
        public static const ZOOM_TOGGLE:String;
        public static const RESIZED:String;
        public static const CAMERA_TOGGLE:String;

        private var _iconId:String;
        private var _iconName:String;

        public function HabboToolbarEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false);

        public function set iconId(k:String):void;

        public function get iconId():String;

        public function set iconName(k:String):void;

        public function get iconName():String;


    }
}//package com.sulake.habbo.toolbar.events

