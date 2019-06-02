//com.sulake.habbo.communication.messages.incoming.help.CallForHelpDisabledNotifyMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.CallForHelpDisabledNotifyMessageParser;

    [SecureSWF(rename="true")]
    public class CallForHelpDisabledNotifyMessageEvent extends MessageEvent implements IMessageEvent {

        public function CallForHelpDisabledNotifyMessageEvent(k:Function);

        public function getParser():CallForHelpDisabledNotifyMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

