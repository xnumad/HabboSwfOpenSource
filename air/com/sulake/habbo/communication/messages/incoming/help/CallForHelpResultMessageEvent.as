//com.sulake.habbo.communication.messages.incoming.help.CallForHelpResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpResultMessageParser;

    [SecureSWF(rename="true")]
    public class CallForHelpResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function CallForHelpResultMessageEvent(k:Function);

        public function getParser():CallForHelpResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

