//com.sulake.habbo.session.events.RoomSessionChatEvent

package com.sulake.habbo.session.events{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionChatEvent extends RoomSessionEvent {

        public static const ROOM_SESSION_CHAT_EVENT:String;
        public static const ROOM_SESSION_FLOODCONTROL_EVENT:String;
        public static const CHAT_TYPE_SPEAK:int;
        public static const CHAT_TYPE_WHISPER:int;
        public static const CHAT_TYPE_SHOUT:int;
        public static const CHAT_TYPE_RESPECT:int;
        public static const CHAT_TYPE_PETRESPECT:int;
        public static const CHAT_TYPE_HAND_ITEM_RECEIVED:int;
        public static const CHAT_TYPE_PETTREAT:int;
        public static const CHAT_TYPE_PETREVIVE:int;
        public static const CHAT_TYPE_PET_REBREED_FERTILIZE:int;
        public static const CHAT_TYPE_PET_SPEED_FERTILIZE:int;

        private var _userId:int;
        private var _text:String;
        private var _chatType:int;
        private var _links:Array;
        private var _extraParam:int;
        private var _style:int;

        public function RoomSessionChatEvent(k:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:String, _arg_5:int=0, _arg_6:int=0, _arg_7:Array=null, _arg_8:int=-1);

        public function get userId():int;

        public function get text():String;

        public function get chatType():int;

        public function get links():Array;

        public function get extraParam():int;

        public function get style():int;


    }
}//package com.sulake.habbo.session.events

