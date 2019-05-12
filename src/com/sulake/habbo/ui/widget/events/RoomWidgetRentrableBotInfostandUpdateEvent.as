package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRentrableBotInfostandUpdateEvent extends RoomWidgetUpdateEvent 
    {
        public static const RENTABLE_BOT:String = "RWRBIUE_RENTABLE_BOT";
        public static const _Str_7492:String = "RENTABLE_BOT";

        private var _name:String = "";
        private var _motto:String = "";
        private var _Str_4900:int = 0;
        private var _figure:String = "";
        private var _badges:Array;
        private var _Str_5228:int = 0;
        private var _Str_5131:int = 0;
        private var _ownerId:int;
        private var _ownerName:String;
        private var _Str_4026:Boolean = false;
        private var _Str_4028:Boolean = false;
        private var _roomControllerLevel:int = 0;
        private var _Str_3986:Array;

        public function RoomWidgetRentrableBotInfostandUpdateEvent(k:Boolean=false, _arg_2:Boolean=false)
        {
            this._badges = [];
            super(RENTABLE_BOT, k, _arg_2);
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get name():String
        {
            return this._name;
        }

        public function set motto(k:String):void
        {
            this._motto = k;
        }

        public function get motto():String
        {
            return this._motto;
        }

        public function set _Str_2394(k:int):void
        {
            this._Str_4900 = k;
        }

        public function get _Str_2394():int
        {
            return this._Str_4900;
        }

        public function set figure(k:String):void
        {
            this._figure = k;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function set badges(k:Array):void
        {
            this._badges = k;
        }

        public function get badges():Array
        {
            return this._badges;
        }

        public function get ownerId():int
        {
            return this._ownerId;
        }

        public function set ownerId(k:int):void
        {
            this._ownerId = k;
        }

        public function get ownerName():String
        {
            return this._ownerName;
        }

        public function set ownerName(k:String):void
        {
            this._ownerName = k;
        }

        public function set _Str_3246(k:Boolean):void
        {
            this._Str_4026 = k;
        }

        public function get _Str_3246():Boolean
        {
            return this._Str_4026;
        }

        public function set roomControllerLevel(k:int):void
        {
            this._roomControllerLevel = k;
        }

        public function get roomControllerLevel():int
        {
            return this._roomControllerLevel;
        }

        public function set _Str_3529(k:Boolean):void
        {
            this._Str_4028 = k;
        }

        public function get _Str_3529():Boolean
        {
            return this._Str_4028;
        }

        public function set _Str_3249(k:int):void
        {
            this._Str_5228 = k;
        }

        public function get _Str_3249():int
        {
            return this._Str_5228;
        }

        public function set _Str_3313(k:int):void
        {
            this._Str_5131 = k;
        }

        public function get _Str_3313():int
        {
            return this._Str_5131;
        }

        public function get _Str_2899():Array
        {
            return this._Str_3986;
        }

        public function set _Str_2899(k:Array):void
        {
            this._Str_3986 = k;
        }
    }
}
