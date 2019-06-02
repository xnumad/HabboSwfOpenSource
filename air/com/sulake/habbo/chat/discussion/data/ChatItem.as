//com.sulake.habbo.chat.discussion.data.ChatItem

package com.sulake.habbo.chat.discussion.data{
    import com.sulake.room.utils.IVector3d;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;

    public class ChatItem {

        private var _timestamp:int;
        private var _userId:int;
        private var _roomId:int;
        private var _text:String;
        private var _chatType:int;
        private var _links:Array;
        private var _style:int;
        private var _userLocation:IVector3d;
        private var _forcedColor;
        private var _forcedScreenLocation;
        private var _forcedFigure:String;
        private var _forcedUserName:String;
        private var _extraParam:int;

        public function ChatItem(k:RoomSessionChatEvent, _arg_2:int, _arg_3:IVector3d=null, _arg_4:int=0, _arg_5:*=null, _arg_6:*=null, _arg_7:String=null, _arg_8:String=null);

        public function get userId():int;

        public function get roomId():int;

        public function get text():String;

        public function get chatType():int;

        public function get links():Array;

        public function get style():int;

        public function get timeStamp():uint;

        public function get userLocation():IVector3d;

        public function get forcedColor();

        public function get forcedScreenLocation();

        public function get forcedFigure():String;

        public function get forcedUserName():String;

        public function get extraParam():int;

        public function set text(k:String):void;


    }
}//package com.sulake.habbo.chat.discussion.data

