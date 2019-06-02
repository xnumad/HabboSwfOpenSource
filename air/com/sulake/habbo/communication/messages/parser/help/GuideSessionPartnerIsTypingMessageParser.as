//com.sulake.habbo.communication.messages.parser.help.GuideSessionPartnerIsTypingMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionPartnerIsTypingMessageParser implements IMessageParser {

        private var _isTyping:Boolean;

        public function GuideSessionPartnerIsTypingMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get isTyping():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

