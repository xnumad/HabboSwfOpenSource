//com.sulake.habbo.communication.messages.parser.groupforums.PostThreadMessageParser

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PostThreadMessageParser implements IMessageParser {

        private var _groupId:int;
        private var _thread:ThreadData;

        public function PostThreadMessageParser();

        public function get groupId():int;

        public function get thread():ThreadData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

