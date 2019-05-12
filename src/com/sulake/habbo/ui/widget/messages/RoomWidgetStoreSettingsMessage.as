package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetStoreSettingsMessage extends RoomWidgetMessage 
    {
        public static const RWSSM_STORE_SETTINGS:String = "RWSSM_STORE_SETTINGS";
        public static const RWSSM_STORE_SOUND:String = "RWSSM_STORE_SOUND";
        public static const RWSSM_PREVIEW_SOUND:String = "RWSSM_PREVIEW_SOUND";
        public static const RWSSM_STORE_CHAT:String = "RWSSM_STORE_CHAT";

        private var _traxVolume:Number;
        private var _furniVolume:Number;
        private var _genericVolume:Number;
        private var _forceOldChat:Boolean;

        public function RoomWidgetStoreSettingsMessage(k:String)
        {
            super(k);
        }

        public function get _Str_3410():Number
        {
            return this._traxVolume;
        }

        public function set _Str_3410(k:Number):void
        {
            this._traxVolume = k;
        }

        public function get _Str_3488():Number
        {
            return this._furniVolume;
        }

        public function set _Str_3488(k:Number):void
        {
            this._furniVolume = k;
        }

        public function get _Str_3960():Number
        {
            return this._genericVolume;
        }

        public function set _Str_3960(k:Number):void
        {
            this._genericVolume = k;
        }

        public function get _Str_12967():Boolean
        {
            return this._forceOldChat;
        }

        public function set _Str_12967(k:Boolean):void
        {
            this._forceOldChat = k;
        }
    }
}
