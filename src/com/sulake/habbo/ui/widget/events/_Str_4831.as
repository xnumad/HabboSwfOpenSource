package com.sulake.habbo.ui.widget.events
{
    public class _Str_4831 extends RoomWidgetUpdateEvent 
    {
        public static const RWWCIDE_CHAT_INPUT_CONTENT:String = "RWWCIDE_CHAT_INPUT_CONTENT";
        public static const WHISPER:String = "whisper";
        public static const SHOUT:String = "shout";

        private var _Str_21134:String = "";
        private var _userName:String = "";

        public function _Str_4831(k:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RWWCIDE_CHAT_INPUT_CONTENT, _arg_3, _arg_4);
            this._Str_21134 = k;
            this._userName = _arg_2;
        }

        public function get _Str_23621():String
        {
            return this._Str_21134;
        }

        public function get userName():String
        {
            return this._userName;
        }
    }
}
