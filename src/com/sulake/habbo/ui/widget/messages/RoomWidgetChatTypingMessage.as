package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChatTypingMessage extends RoomWidgetMessage 
    {
        public static const RWCTM_TYPING_STATUS:String = "RWCTM_TYPING_STATUS";

        private var _isTyping:Boolean;

        public function RoomWidgetChatTypingMessage(k:Boolean)
        {
            super(RWCTM_TYPING_STATUS);
            this._isTyping = k;
        }

        public function get _Str_7319():Boolean
        {
            return this._isTyping;
        }
    }
}
