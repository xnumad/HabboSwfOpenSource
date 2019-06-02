//com.sulake.habbo.communication.messages.incoming.help.GuideSessionDetachedMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionDetachedMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionDetachedMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionDetachedMessageEvent(k:Function);

        public function getParser():GuideSessionDetachedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

