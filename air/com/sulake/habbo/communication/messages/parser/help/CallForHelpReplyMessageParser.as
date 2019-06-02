//com.sulake.habbo.communication.messages.parser.help.CallForHelpReplyMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CallForHelpReplyMessageParser implements IMessageParser {

        private var _message:String;

        public function CallForHelpReplyMessageParser();

        public function get message():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

