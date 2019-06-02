//com.sulake.habbo.communication.messages.incoming.moderation.ChatRecordData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import flash.utils.Dictionary;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ChatRecordData {

        public static const TYPE_SIMPLE:int;
        public static const TYPE_ROOM_CHAT:int;
        public static const TYPE_IM_SESSION:int;
        public static const TYPE_DISCUSSION_THREAD:int;
        public static const TYPE_DISCUSSION_MESSAGE:int;

        private var _recordType:int;
        private var _context:Dictionary;
        private var _chatlog:Array;

        public function ChatRecordData(k:IMessageDataWrapper);

        public function get recordType():int;

        public function get context():Dictionary;

        public function get chatlog():Array;

        public function get roomId():int;

        public function get roomName():String;

        public function get groupId():int;

        public function get threadId():int;

        public function get messageId():int;

        private function getInt(k:String):int;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

