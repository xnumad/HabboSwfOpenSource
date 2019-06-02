//com.sulake.habbo.communication.messages.parser.help.CallForHelpPendingCallsDeletedMessageParser

package com.sulake.habbo.communication.messages.parser.help{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CallForHelpPendingCallsDeletedMessageParser implements IMessageParser {

        public function CallForHelpPendingCallsDeletedMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.help

