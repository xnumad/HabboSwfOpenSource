//com.sulake.habbo.communication.messages.parser.groupforums.MessageData

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MessageData {

        private var _groupId:int;
        private var _MessageId:int;
        private var _MessageIndex:int;
        private var _authorId:int;
        private var _threadId:int;
        private var _creationTime:int;
        private var _messageText:String;
        private var _authorName:String;
        private var _authorFigure:String;
        private var _state:int;
        private var _adminId:int;
        private var _adminName:String;
        private var _adminOperationTimeAsSeccondsAgo:int;

        public function MessageData();

        public static function readFromMessage(k:IMessageDataWrapper):MessageData;


        public function get state():int;

        public function set state(k:int):void;

        public function get adminId():int;

        public function set adminId(k:int):void;

        public function get adminName():String;

        public function set adminName(k:String):void;

        public function get adminOperationTimeAsSeccondsAgo():int;

        public function set adminOperationTimeAsSeccondsAgo(k:int):void;

        public function get MessageId():int;

        public function set MessageId(k:int):void;

        public function get creationTime():int;

        public function set creationTime(k:int):void;

        public function get authorName():String;

        public function set authorName(k:String):void;

        public function get authorFigure():String;

        public function set authorFigure(k:String):void;

        public function get threadId():int;

        public function set threadId(k:int):void;

        public function get messageId():int;

        public function set messageId(k:int):void;

        public function get messageIndex():int;

        public function set messageIndex(k:int):void;

        public function set groupID(k:int):void;

        public function get groupId():int;

        public function get authorId():int;

        public function set authorId(k:int):void;

        public function get creationTimeAsSecondsAgo():int;

        public function set creationTimeAsSecondsAgo(k:int):void;

        public function get messageText():String;

        public function set messageText(k:String):void;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

