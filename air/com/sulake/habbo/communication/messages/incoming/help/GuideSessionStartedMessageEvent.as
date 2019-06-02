//com.sulake.habbo.communication.messages.incoming.help.GuideSessionStartedMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionStartedMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionStartedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionStartedMessageEvent(k:Function);

        public function getParser():GuideSessionStartedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

