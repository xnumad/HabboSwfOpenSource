package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionChatEvent extends RoomSessionEvent 
    {
        public static const RSCE_CHAT_EVENT:String = "RSCE_CHAT_EVENT";
        public static const RSCE_FLOOD_EVENT:String = "RSCE_FLOOD_EVENT";
        public static const CHAT_TYPE_SPEAK:int = 0;
        public static const CHAT_TYPE_WHISPER:int = 1;
        public static const CHAT_TYPE_SHOUT:int = 2;
        public static const CHAT_TYPE_RESPECT:int = 3;
        public static const CHAT_TYPE_PETRESPECT:int = 4;
        public static const CHAT_TYPE_HAND_ITEM_RECEIVED:int = 5;
        public static const CHAT_TYPE_PETTREAT:int = 6;
        public static const CHAT_TYPE_PETREVIVE:int = 7;
        public static const CHAT_TYPE_PET_REBREED_FERTILIZE:int = 8;
        public static const CHAT_TYPE_PET_SPEED_FERTILIZE:int = 9;
        public static const _Str_8909:int = 10;

        private var _userId:int = 0;
        private var _text:String = "";
        private var _chatType:int = 0;
        private var _links:Array;
        private var _extraParam:int;
        private var _style:int;

        public function RoomSessionChatEvent(k:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:String, _arg_5:int=0, _arg_6:int=0, _arg_7:Array=null, _arg_8:int=-1)
        {
            super(k, _arg_2, false, false);
            this._userId = _arg_3;
            this._text = _arg_4;
            this._chatType = _arg_5;
            this._links = _arg_7;
            this._extraParam = _arg_8;
            this._style = _arg_6;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get text():String
        {
            return this._text;
        }

        public function get chatType():int
        {
            return this._chatType;
        }

        public function get links():Array
        {
            return this._links;
        }

        public function get extraParam():int
        {
            return this._extraParam;
        }

        public function get style():int
        {
            return this._style;
        }
    }
}
