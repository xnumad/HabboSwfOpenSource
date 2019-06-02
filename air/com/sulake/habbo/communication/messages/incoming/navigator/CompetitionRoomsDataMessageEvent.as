//com.sulake.habbo.communication.messages.incoming.navigator.CompetitionRoomsDataMessageEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CompetitionRoomsDataMessageParser;

    [SecureSWF(rename="true")]
    public class CompetitionRoomsDataMessageEvent extends MessageEvent implements IMessageEvent {

        public function CompetitionRoomsDataMessageEvent(k:Function);

        public function getParser():CompetitionRoomsDataMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

