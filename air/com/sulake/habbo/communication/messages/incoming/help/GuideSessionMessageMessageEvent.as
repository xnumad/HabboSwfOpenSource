//com.sulake.habbo.communication.messages.incoming.help.GuideSessionMessageMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionMessageMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionMessageMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionMessageMessageEvent(k:Function);

        public function getParser():GuideSessionMessageMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

