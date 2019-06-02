package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChatMessage extends RoomWidgetMessage 
    {
        public static const RWCM_MESSAGE_CHAT:String = "RWCM_MESSAGE_CHAT";
        public static const CHAT_TYPE_SPEAK:int = 0;
        public static const CHAT_TYPE_WHISPER:int = 1;
        public static const CHAT_TYPE_SHOUT:int = 2;

        private var _chatType:int = 0;
        private var _text:String = "";
        private var _recipientName:String = "";
        private var _styleId:int;

        public function RoomWidgetChatMessage(k:String, _arg_2:String, _arg_3:int=0, _arg_4:String="", _arg_5:int=0)
        {
            super(k);
            this._text = _arg_2;
            this._chatType = _arg_3;
            this._recipientName = _arg_4;
            this._styleId = _arg_5;
        }

        public function get chatType():int
        {
            return this._chatType;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get _Str_23716():String
        {
            return this._recipientName;
        }

        public function get styleId():int
        {
            return this._styleId;
        }
    }
}
