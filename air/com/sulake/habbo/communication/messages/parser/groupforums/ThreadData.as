//com.sulake.habbo.communication.messages.parser.groupforums.ThreadData

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ThreadData {

        private var _threadId:int;
        private var _threadAuthorId:int;
        private var _threadAuthorName:String;
        private var _creationTimeAsSecondsAgo:int;
        private var _header:String;
        private var _nMessages:int;
        private var _nUnreadMessages:int;
        private var _lastMessageId:int;
        private var _lastMessageAuthorId:int;
        private var _lastMessageAuthorName:String;
        private var _lastMessageTimeAsSecondsAgo:int;
        private var _state:int;
        private var _adminId:int;
        private var _adminName:String;
        private var _adminOperationTimeAsSecondsAgo:int;
        private var _isSticky:Boolean;
        private var _isLocked:Boolean;

        public function ThreadData();

        public static function readFromMessage(k:IMessageDataWrapper):ThreadData;


        public function get adminOperationTimeAsSecondsAgo():int;

        public function set adminOperationTimeAsSecondsAgo(k:int):void;

        public function get lastMessageTimeAsSecondsAgo():int;

        public function set lastMessageTimeAsSecondsAgo(k:int):void;

        public function get threadId():int;

        public function set threadId(k:int):void;

        public function get threadAuthorId():int;

        public function set threadAuthorId(k:int):void;

        public function get threadAuthorName():String;

        public function set threadAuthorName(k:String):void;

        public function get creationTimeAsSecondsAgo():int;

        public function set creationTimeAsSecondsAgo(k:int):void;

        public function get header():String;

        public function set header(k:String):void;

        public function get lastMessageId():int;

        public function set lastMessageId(k:int):void;

        public function get lastMessageAuthorId():int;

        public function set lastMessageAuthorId(k:int):void;

        public function get lastMessageAuthorName():String;

        public function set lastMessageAuthorName(k:String):void;

        public function get nMessages():int;

        public function set nMessages(k:int):void;

        public function get nUnreadMessages():int;

        public function set nUnreadMessages(k:int):void;

        public function get state():int;

        public function set state(k:int):void;

        public function get adminId():int;

        public function set adminId(k:int):void;

        public function get adminName():String;

        public function set adminName(k:String):void;

        public function get isSticky():Boolean;

        public function set isSticky(k:Boolean):void;

        public function get isLocked():Boolean;

        public function set isLocked(k:Boolean):void;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

