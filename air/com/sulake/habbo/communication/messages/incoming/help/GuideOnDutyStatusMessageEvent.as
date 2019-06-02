//com.sulake.habbo.communication.messages.incoming.help.GuideOnDutyStatusMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideOnDutyStatusMessageParser;

    [SecureSWF(rename="true")]
    public class GuideOnDutyStatusMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideOnDutyStatusMessageEvent(k:Function);

        public function getParser():GuideOnDutyStatusMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

