//com.sulake.habbo.communication.messages.parser.groupforums.ForumData

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ForumData {

        private var _groupId:int;
        private var _name:String;
        private var _description:String;
        private var _icon:String;
        private var _totalThreads:int;
        private var _leaderboardScore:int;
        private var _totalMessages:int;
        private var _unreadMessages:int;
        private var _lastMessageId:int;
        private var _lastMessageAuthorId:int;
        private var _lastMessageAuthorName:String;
        private var _lastMessageTimeAsSecondsAgo:int;

        public function ForumData();

        public static function readFromMessage(k:IMessageDataWrapper):ForumData;

        static function fillFromMessage(k:ForumData, _arg_2:IMessageDataWrapper):ForumData;


        public function get groupId():int;

        public function get name():String;

        public function get description():String;

        public function get icon():String;

        public function get totalThreads():int;

        public function get leaderboardScore():int;

        public function get totalMessages():int;

        public function get unreadMessages():int;

        public function get lastMessageId():int;

        public function get lastMessageAuthorId():int;

        public function get lastMessageAuthorName():String;

        public function get lastMessageTimeAsSecondsAgo():int;

        public function updateFrom(k:ForumData):void;

        public function get lastReadMessageId():int;

        public function set lastReadMessageId(k:int):void;

        public function addNewThread(k:ThreadData):void;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

