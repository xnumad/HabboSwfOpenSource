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

        public function get traxVolume():Number
        {
            return this._traxVolume;
        }

        public function set traxVolume(k:Number):void
        {
            this._traxVolume = k;
        }

        public function get furniVolume():Number
        {
            return this._furniVolume;
        }

        public function set furniVolume(k:Number):void
        {
            this._furniVolume = k;
        }

        public function get genericVolume():Number
        {
            return this._genericVolume;
        }

        public function set genericVolume(k:Number):void
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
