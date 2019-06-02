//com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CallForHelpPendingCallsMessageParser implements IMessageParser {

        private var _callArray:Array;

        public function CallForHelpPendingCallsMessageParser();

        public function get callArray():Array;

        public function get callCount():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

