//com.sulake.habbo.communication.messages.incoming.moderation.RoomVisitsEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.RoomVisitsMessageParser;

    [SecureSWF(rename="true")]
    public class RoomVisitsEvent extends MessageEvent implements IMessageEvent {

        public function RoomVisitsEvent(k:Function);

        public function getParser():RoomVisitsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

