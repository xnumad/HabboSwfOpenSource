//com.sulake.habbo.communication.messages.parser.groupforums.UpdateMessageMessageParser

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UpdateMessageMessageParser implements IMessageParser {

        private var _groupId:int;
        private var _threadId:int;
        private var _message:MessageData;

        public function UpdateMessageMessageParser();

        public function get groupId():int;

        public function get threadId():int;

        public function get message():MessageData;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

