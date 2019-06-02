//com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser

package com.sulake.habbo.communication.messages.parser.friendlist{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class NewConsoleMessageMessageParser implements IMessageParser {

        private var _senderId:int;
        private var _messageText:String;
        private var _secondsSinceSent:int;

        public function NewConsoleMessageMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get senderId():int;

        public function get messageText():String;

        public function get secondsSinceSent():int;


    }
}//package com.sulake.habbo.communication.messages.parser.friendlist

