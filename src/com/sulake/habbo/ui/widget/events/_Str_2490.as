package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class _Str_2490 extends RoomWidgetUpdateEvent 
    {
        public static const RWPDUE_PACKAGEINFO:String = "RWPDUE_PACKAGEINFO";
        public static const RWPDUE_CONTENTS:String = "RWPDUE_CONTENTS";
        public static const RWPDUE_CONTENTS_CLUB:String = "RWPDUE_CONTENTS_CLUB";
        public static const RWPDUE_CONTENTS_FLOOR:String = "RWPDUE_CONTENTS_FLOOR";
        public static const RWPDUE_CONTENTS_LANDSCAPE:String = "RWPDUE_CONTENTS_LANDSCAPE";
        public static const RWPDUE_CONTENTS_WALLPAPER:String = "RWPDUE_CONTENTS_WALLPAPER";
        public static const RWPDUE_CONTENTS_IMAGE:String = "RWPDUE_CONTENTS_IMAGE";

        private var _Str_2319:int = -1;
        private var _Str_2825:int = 0;
        private var _Str_2625:String = "";
        private var _text:String;
        private var _controller:Boolean;
        private var _Str_12168:BitmapData;
        private var _Str_19174:String;
        private var _Str_19510:String;
        private var _Str_3054:int = -1;
        private var _Str_3970:String = "";
        private var _Str_3224:Boolean;

        public function _Str_2490(k:String, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:BitmapData=null, _arg_6:String=null, _arg_7:String=null, _arg_8:Boolean=false, _arg_9:Boolean=false)
        {
            super(k, _arg_8, _arg_9);
            this._Str_2319 = _arg_2;
            this._text = _arg_3;
            this._controller = _arg_4;
            this._Str_12168 = _arg_5;
            this._Str_19174 = _arg_6;
            this._Str_19510 = _arg_7;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get classId():int
        {
            return this._Str_2825;
        }

        public function set classId(k:int):void
        {
            this._Str_2825 = k;
        }

        public function get _Str_2887():String
        {
            return this._Str_2625;
        }

        public function set _Str_2887(k:String):void
        {
            this._Str_2625 = k;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get controller():Boolean
        {
            return this._controller;
        }

        public function get _Str_11625():BitmapData
        {
            return this._Str_12168;
        }

        public function get _Str_22956():String
        {
            return this._Str_19174;
        }

        public function get _Str_23105():String
        {
            return this._Str_19510;
        }

        public function get placedItemId():int
        {
            return this._Str_3054;
        }

        public function set placedItemId(k:int):void
        {
            this._Str_3054 = k;
        }

        public function get _Str_4057():Boolean
        {
            return this._Str_3224;
        }

        public function set _Str_4057(k:Boolean):void
        {
            this._Str_3224 = k;
        }

        public function get placedItemType():String
        {
            return this._Str_3970;
        }

        public function set placedItemType(k:String):void
        {
            this._Str_3970 = k;
        }
    }
}
