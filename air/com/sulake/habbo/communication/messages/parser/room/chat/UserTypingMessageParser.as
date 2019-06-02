//com.sulake.habbo.communication.messages.parser.room.chat.UserTypingMessageParser

package com.sulake.habbo.communication.messages.parser.room.chat{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserTypingMessageParser implements IMessageParser {

        private var _userId:int;
        private var _isTyping:Boolean;

        public function UserTypingMessageParser();

        public function get userId():int;

        public function get isTyping():Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.chat

