//com.sulake.habbo.communication.messages.parser.groupforums.ForumThreadsMessageParser

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ForumThreadsMessageParser implements IMessageParser {

        private var _groupId:int;
        private var _startIndex:int;
        private var _amount:int;
        private var _threads:Array;

        public function ForumThreadsMessageParser();

        public function get groupId():int;

        public function get startIndex():int;

        public function get amount():int;

        public function get threads():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

