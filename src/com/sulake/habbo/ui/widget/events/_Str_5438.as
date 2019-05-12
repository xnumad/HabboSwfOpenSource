package com.sulake.habbo.ui.widget.events
{
    public class _Str_5438 extends RoomWidgetUpdateEvent 
    {
        public static const RWWGUE_WELCOME_GIFT_WIDGET_STATUS:String = "rwwgue_welcome_gift_widget_status";

        private var _email:String;
        private var _Str_4340:Boolean;
        private var _Str_5694:Boolean;
        private var _furniId:int;
        private var _Str_10840:Boolean;

        public function _Str_5438(k:Boolean=false, _arg_2:Boolean=false)
        {
            super(RWWGUE_WELCOME_GIFT_WIDGET_STATUS, k, _arg_2);
        }

        public function get email():String
        {
            return this._email;
        }

        public function get _Str_5738():Boolean
        {
            return this._Str_4340;
        }

        public function get _Str_17916():Boolean
        {
            return this._Str_5694;
        }

        public function get furniId():int
        {
            return this._furniId;
        }

        public function get _Str_10512():Boolean
        {
            return this._Str_10840;
        }

        public function set email(k:String):void
        {
            this._email = k;
        }

        public function set _Str_5738(k:Boolean):void
        {
            this._Str_4340 = k;
        }

        public function set _Str_17916(k:Boolean):void
        {
            this._Str_5694 = k;
        }

        public function set furniId(k:int):void
        {
            this._furniId = k;
        }

        public function set _Str_10512(k:Boolean):void
        {
            this._Str_10840 = k;
        }
    }
}
