package com.sulake.habbo.toolbar.events
{
    import flash.events.Event;

    public class HabboToolbarEvent extends Event 
    {
        public static const HTE_TOOLBAR_CLICK:String = "HTE_TOOLBAR_CLICK";
        public static const HTE_GROUP_ROOM_INFO_CLICK:String = "HTE_GROUP_ROOM_INFO_CLICK";
        public static const HTIE_ICON_ZOOM:String = "HTIE_ICON_ZOOM";
        public static const HTE_RESIZED:String = "HTE_RESIZED";
        public static const HTE_ICON_CAMERA:String = "HTE_ICON_CAMERA";
		public static const ICON_MODTOOL:String = "HTE_ICON_MODTOOL";
        public static const ROOMTOOLSMENU:String = "roomToolsMenu";
        public static const CHATCAMERACOMMAND:String = "chatCameraCommand";
        public static const IMAGEWIDGETMAKEOWN:String = "imageWidgetMakeOwn";
        public static const TOOLBARCAMERAICON:String = "toolBarCameraIcon";

        private var _iconId:String;
        private var _iconName:String;

        public function HabboToolbarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }

        public function set _Str_3378(k:String):void
        {
            this._iconId = k;
        }

        public function get _Str_3378():String
        {
            return this._iconId;
        }

        public function set _Str_4856(k:String):void
        {
            this._iconName = k;
        }

        public function get _Str_4856():String
        {
            return this._iconName;
        }
    }
}
