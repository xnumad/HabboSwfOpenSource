//com.sulake.habbo.communication.messages.incoming.help.GuideSessionEndedMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionEndedMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionEndedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionEndedMessageEvent(k:Function);

        public function getParser():GuideSessionEndedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

