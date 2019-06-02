//com.sulake.habbo.communication.messages.incoming.competition.CurrentTimingCodeMessageEvent

package com.sulake.habbo.communication.messages.incoming.competition{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.CurrentTimingCodeMessageParser;

    [SecureSWF(rename="true")]
    public class CurrentTimingCodeMessageEvent extends MessageEvent implements IMessageEvent {

        public function CurrentTimingCodeMessageEvent(k:Function);

        public function getParser():CurrentTimingCodeMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.competition

