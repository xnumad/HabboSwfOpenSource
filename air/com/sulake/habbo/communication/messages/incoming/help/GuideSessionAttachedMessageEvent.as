//com.sulake.habbo.communication.messages.incoming.help.GuideSessionAttachedMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionAttachedMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionAttachedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionAttachedMessageEvent(k:Function);

        public function getParser():GuideSessionAttachedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

