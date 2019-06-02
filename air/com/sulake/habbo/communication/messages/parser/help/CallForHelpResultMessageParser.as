//com.sulake.habbo.communication.messages.parser.help.CallForHelpResultMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CallForHelpResultMessageParser implements IMessageParser {

        private var _resultType:int;

        public function CallForHelpResultMessageParser();

        public function get resultType():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

