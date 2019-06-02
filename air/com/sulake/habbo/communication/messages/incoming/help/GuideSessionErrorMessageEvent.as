//com.sulake.habbo.communication.messages.incoming.help.GuideSessionErrorMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionErrorMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionErrorMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionErrorMessageEvent(k:Function);

        public function getParser():GuideSessionErrorMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

