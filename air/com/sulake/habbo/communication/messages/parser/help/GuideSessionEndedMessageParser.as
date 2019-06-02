//com.sulake.habbo.communication.messages.parser.help.GuideSessionEndedMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GuideSessionEndedMessageParser implements IMessageParser {

        private var _endReason:int;

        public function GuideSessionEndedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get endReason():int;


    }
}//package com.sulake.habbo.communication.messages.parser.help

