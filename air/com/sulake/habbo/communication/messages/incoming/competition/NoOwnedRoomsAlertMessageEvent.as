//com.sulake.habbo.communication.messages.incoming.competition.NoOwnedRoomsAlertMessageEvent

package com.sulake.habbo.communication.messages.incoming.competition{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.competition.NoOwnedRoomsAlertMessageParser;

    [SecureSWF(rename="true")]
    public class NoOwnedRoomsAlertMessageEvent extends MessageEvent implements IMessageEvent {

        public function NoOwnedRoomsAlertMessageEvent(k:Function);

        public function getParser():NoOwnedRoomsAlertMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.competition

