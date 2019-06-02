package com.sulake.habbo.freeflowchat.data
{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;

    public class ChatItem 
    {
        private var _timestamp:int = 0;
        private var _userId:int = 0;
        private var _roomId:int = 0;
        private var _text:String = "";
        private var _chatType:int;
        private var _links:Array;
        private var _style:int;
        private var _userLocation:IVector3d;
        private var _forcedColor:*;
        private var _forcedScreenLocation:*;
        private var _forcedFigure:String;
        private var _forcedUserName:String;
        private var _extraParam:int;

        public function ChatItem(k:RoomSessionChatEvent, _arg_2:int, _arg_3:IVector3d=null, _arg_4:int=0, _arg_5:*=null, _arg_6:*=null, _arg_7:String=null, _arg_8:String=null)
        {
            this._chatType = RoomSessionChatEvent.CHAT_TYPE_SPEAK;
            super();
            this._timestamp = _arg_2;
            this._userLocation = _arg_3;
            this._userId = k.userId;
            if (k.session)
            {
                this._roomId = k.session.roomId;
            }
            else
            {
                this._roomId = 1;
            }
            this._text = k.text;
            this._chatType = k.chatType;
            this._style = k.style;
            this._links = new Array(k.links);
            this._forcedColor = _arg_6;
            this._forcedScreenLocation = _arg_5;
            this._forcedFigure = _arg_7;
            this._forcedUserName = _arg_8;
            this._extraParam = _arg_4;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get roomId():int
        {
            return this._roomId;
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

        public function get style():int
        {
            return this._style;
        }

        public function get timeStamp():uint
        {
            return this._timestamp;
        }

        public function get _Str_20712():IVector3d
        {
            return this._userLocation;
        }

        public function get _Str_15133():*
        {
            return this._forcedColor;
        }

        public function get _Str_12917():*
        {
            return this._forcedScreenLocation;
        }

        public function get _Str_15251():String
        {
            return this._forcedFigure;
        }

        public function get _Str_14270():String
        {
            return this._forcedUserName;
        }

        public function get extraParam():int
        {
            return this._extraParam;
        }

        public function set text(k:String):void
        {
            this._text = k;
        }
    }
}
