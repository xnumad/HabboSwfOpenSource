//com.sulake.habbo.communication.messages.incoming.competition.SecondsUntilMessageEvent

package com.sulake.habbo.communication.messages.incoming.competition{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.SecondsUntilMessageParser;

    [SecureSWF(rename="true")]
    public class SecondsUntilMessageEvent extends MessageEvent implements IMessageEvent {

        public function SecondsUntilMessageEvent(k:Function);

        public function getParser():SecondsUntilMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.competition

